#import "Basic";
#import "enet";

client : *ENetHost;

main :: () {

    if enet_initialize() != 0 {
        print("Error initializing enet\n");
        exit(-1);
    } else {
        print("Initialized enet successfully\n");
    }

    client = enet_host_create(
        null, //. Create client host
        1,
        2,
        0, 0
    );

    if client == null {
        print("Error creating client host\n");
        exit(-1);
    } else {
        print("Client host created\n");
    }

    targetAddress : ENetAddress;
    event : ENetEvent;
    peer : *ENetPeer;

    enet_address_set_host(*targetAddress, "localhost");
    targetAddress.port = 7777;

    peer = enet_host_connect(client, *targetAddress, 2, 10);
    if peer == null {
        print("Failed to connect to remote host\n");
        exit(-1);
    }

    // enet_peer_reset_queues (peer); // Actually a function internal to enet library! Not suppsed to be called by the user.

    if enet_host_service(client, *event, 5000) > 0 &&
        event.type == .ENET_EVENT_TYPE_CONNECT
    {
            print("Connection to remote host succeeded\n");
            enet_host_flush(client); // TODO: Remove later. Just to see the server to actually get the event.
    } else {
        print("Connection timed out\n");
        enet_peer_reset(peer);
    }


    enet_host_destroy(client);
    enet_deinitialize();

}




