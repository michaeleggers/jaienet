// This is just a small example of compiling a C++ library, generating bindings for it and using them.
// Look at modules/ImGui/generate.jai or modules/d3d11/generate.jai
// for more comprehensive examples of how to use the bindings generator.


AT_COMPILE_TIME :: true;
COMPILE :: false;

ENET_PATH :: "enet";


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

// #run build();

// main :: () {
//     set_working_directory(path_strip_filename(get_path_of_running_executable()));
//     if !generate_bindings() {
//         exit(1);
//     }
// }

generate_bindings :: () -> bool {
    #if COMPILE {
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
        success &&= build_cpp_dynamic_lib("win/enet", ..enet_src_files, extra = .["/DENET_DLL", "/DENET_BUILDING_LIB", "/Ienet/include", "winmm.lib", "ws2_32.lib"], debug=true);
        // success &&= build_cpp_dynamic_lib("win/enet", ..enet_src_files, extra = .["/Ienet/include", "winmm.lib", "ws2_32.lib"], debug=true);

        // success &&= build_cpp_static_lib("win/enet", ..enet_src_files, extra = .["/DENET_API=__declspec(dllexport)", "/Ienet/include"], debug=true);
        
        if !success {
            compiler_set_workspace_status(.FAILED);
            return success;
        }

        // if !generate_bindings() {
        //     compiler_set_workspace_status(.FAILED);
        //     return;
        // }

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

        return success;
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
            array_add(*system_types_to_include, "size_t");
            // array_add(*path_fragments_to_treat_as_non_system_paths, "stddef.h");
            // array_add(*system_types_to_include, "stddef.h");
            // array_add(*system_types_to_include, "fd_set");
            // array_add(*system_types_to_include, "SOCKET");
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
        array_add(*include_paths, "enet/include/enet");
        array_add(*include_paths, "win");
        array_add(*include_paths, ".");
        array_add(*libnames,      "enet");
        

        array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);        
        // array_add(*source_files,  tprint("%/include/enet/callbacks.h", ENET_PATH));
        array_add(*source_files,  tprint("%/include/enet/enet.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/list.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/protocol.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/time.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/types.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/unix.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/utility.h", ENET_PATH));
        // array_add(*source_files,  tprint("%/include/enet/win32.h", ENET_PATH));

        array_add(*extra_clang_arguments, "-x", "c", "-DWIN32_LEAN_AND_MEAN");

        // strip_flags &= ~(Strip_Flags.CONSTRUCTORS | .DESTRUCTORS);
    }

    return generate_bindings(opts, output_filename);
}


#scope_file

#import "System";
#import "Basic";
#import "Compiler";
#import "BuildCpp";
#import "Check";
#import "Bindings_Generator";
#import "File";
