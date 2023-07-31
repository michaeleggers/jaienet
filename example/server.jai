#import "Basic";
// #import "Windows";
// #import "Socket";
#import,dir "enet";


address : ENetAddress;
server : *ENetHost;

main :: () {

    print("Enet Test in JAI\n");

    if enet_initialize() != 0 {
        print("Error initializing enet\n");
        exit(-1);
    } else {
        print("Initialized enet successfully\n");
    }

    address.host = ENET_HOST_ANY;
    address.port = 7777;
    server = enet_host_create(
        *address, 
        32, // max. Clients
        2, // Channels
        0, 0 // Use default algorithm for handling bandwidth
    );

    if server == null {
        print("Failed to create server\n");
        exit(-1);
    } else {
        print("Server running on: %\n", <<server);
    }

    // Game loop
    event : ENetEvent;
    // while true {
        while enet_host_service(server, *event, 0) >= 0 {            
            if event.type == {
                case .ENET_EVENT_TYPE_NONE;
                case .ENET_EVENT_TYPE_CONNECT; print("Client connected\n");
                case .ENET_EVENT_TYPE_RECEIVE; print("Packet received from client\n");
                case .ENET_EVENT_TYPE_DISCONNECT; print("Client disconnected\n");
            }            
        } 
    // }
 

    enet_host_destroy(server);
    enet_deinitialize();
}