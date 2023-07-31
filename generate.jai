// MIT License - Copyright (c) 2023 Michael Eggers
// Bindings generator for enet: https://github.com/lsalzman/enet
// Tested with enet git-commit hash: 2a85cd64459f6ba038d233a634d9440490dbba12
// Currently tested only on Windows.
// Set the ENET_PATH to the location of your enet install.


// Config
AT_COMPILE_TIME :: true;
COMPILE :: true;
ENET_PATH :: "src/enet";


#if AT_COMPILE_TIME {
    #run {        
        set_build_options_dc(.{do_output=false});
        if !generate_bindings() {
            compiler_set_workspace_status(.FAILED);
        }
        return;
    }
} else {
    #import "System";
    #import "String";

    main :: () {    
        set_working_directory(path_strip_filename(get_path_of_running_executable()));
        if !generate_bindings() {
            exit(1);
        }
    }
}

generate_bindings :: () -> bool {
    #if COMPILE && AT_COMPILE_TIME {
        set_build_options_dc(.{do_output=false});
        // set_build_options_dc(.{append_linker_arguments=.["/link winm.lib"]});

        enet_src_files: [..] string;
        array_add(*enet_src_files, tprint("%/callbacks.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/compress.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/host.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/list.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/packet.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/peer.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/protocol.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/win32.c", ENET_PATH));
        array_add(*enet_src_files, tprint("%/unix.c", ENET_PATH));
        // array_add(*enet_src_files, "winmm.lib");

        options := get_build_options();
        make_directory_if_it_does_not_exist("win");
        success := true;
        #if OS == .WINDOWS {
            success &&= build_cpp_dynamic_lib("win/enet", ..enet_src_files, extra = .["/DENET_DLL", "/DENET_BUILDING_LIB", "/Isrc/enet/include", "winmm.lib", "ws2_32.lib"], debug=true);        
            success &&= build_cpp_static_lib("win/enet", ..enet_src_files, extra = .["/Isrc/enet/include"], debug=true);        
        } else #if OS == .LINUX {
            print("Not implemented\n");
            return false;
        } else #if OS == .MACOS {
            print("Not implemented\n");
            return false;
        }        

        w := compiler_create_workspace("Main program");
        
        options.output_type     = .EXECUTABLE;
        options.output_executable_name = "example";
        set_build_options(options, w);
        
        compiler_begin_intercept(w);
        // add_build_file("main.jai", w);

        // while true {
        //     message := compiler_wait_for_message();
        //     if message.kind == {
        //     case .TYPECHECKED;
        //         do_error_checking(null, message);
                
        //     case .COMPLETE;
        //         break;
        //     }
        // }

        compiler_end_intercept(w);

        // return success;
    }

    print("Starting to generate bindings...\n");
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        #if OS == .WINDOWS {
            output_filename          = "module.jai";
            array_add(*libpaths,       "win");
            array_add(*libnames,       "winmm");
            array_add(*libnames,       "ws2_32");
            // TODO(Michael): Is there a better way to define those symbols?
            array_add(*system_types_to_include, "fd_set");
            array_add(*system_types_to_include, "SOCKET");            
            // array_add(*path_fragments_to_treat_as_non_system_paths, "winsock2.h");
            // array_add(*path_fragments_to_treat_as_non_system_paths, "winsock.h");
            strip_flags = 0;
        } else #if OS == .LINUX {
            output_filename          = "linux.jai";
            strip_flags = .INLINED_FUNCTIONS; // Inlined constructor doesn't exist in the library
        } else #if OS == .MACOS {
            // @ToDo: Determine dynamically? Customize?
            array_add(*system_include_paths, "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include");
            output_filename          = "macos.jai";
            strip_flags = .INLINED_FUNCTIONS; // Inlined constructor doesn't exist in the library
        } else {
            assert(false);
        }

        // array_add(*include_paths, ENET_PATH);        
        array_add(*include_paths, "src/enet/include/");
        array_add(*include_paths, "win");
        array_add(*include_paths, ".");
        array_add(*libnames,      "enet");        

        array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);                
        array_add(*source_files,  tprint("%/include/enet/enet.h", ENET_PATH));
        array_add(*extra_clang_arguments, "-x", "c", "-DWIN32_LEAN_AND_MEAN");

        // strip_flags &= ~(Strip_Flags.CONSTRUCTORS | .DESTRUCTORS);
        visitor = enet_visitor;
    }

    return generate_bindings(opts, output_filename);
}

// foo :: #type (u32) -> u32;

enet_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {

    // enet library mixes internal functions and functions to be exported to DLL in the same file (enet.h).
    // Internal functions are not declared with ENET_API. That means the generator finds symbols in the header
    // not present in the DLL/LIB. The following piece of code searches for those functions
    // and does not put them into the jai-binding.
    if decl.kind == .FUNCTION && decl.library == null {
        print("Omit internal function: %\n", decl.name);
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
    }

    // The following is cosmetic: It replaces size_t with u64. But something like
    // size_t :: u64 in the module doesn't hurt because modules are hermetic. It
    // won't clash with names in Application scope.
    // Also, on other platforms size_t might not be u64, so this might even
    // be dangerous to do. I did it anyway because I wanted to see what I can
    // do here. If this is a problem, just whitelist size_t, like eg. 'SOCKET', I guess...
    if decl.kind == .FUNCTION {
        name := decl.name;
        args := decl.type.type_of_function.arguments;        
        for arg : args {
            type_of_typedef := arg.type.type_of_typedef;
            if type_of_typedef {                
                if !compare(type_of_typedef.output_name, "size_t") {
                    type_of_typedef.output_name = "u64";
                }        
            }
        }        
    }

    return .STOP;
}

#scope_file

#import "String";
#import "System";
#import "Basic";
#import "Compiler";
#import "BuildCpp";
#import "Check";
#import "Bindings_Generator";
#import "File";
