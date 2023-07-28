#import "Basic";
// #import "Windows";
// #import "Socket";
#import,dir "jaienet";

main :: () {

    print("Enet Test in JAI\n");

    if enet_initialize() != 0 {
        print("Error initializing enet\n");
        exit(-1);
    } else {
        print("Success!\n");
    }


}