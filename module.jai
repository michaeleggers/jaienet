

#scope_module 

#if OS == .WINDOWS {
    #load "windows.jai";
} else {
    #load "unix.jai";
}