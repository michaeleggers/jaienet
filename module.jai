//
// This file was auto-generated using the following command:
//
// jai generate_simple.jai
//



ENET_VERSION_MAJOR :: 1;
ENET_VERSION_MINOR :: 3;
ENET_VERSION_PATCH :: 17;

ENET_HOST_ANY :: 0;
ENET_HOST_BROADCAST :: 0xFFFFFFFF;
ENET_PORT_ANY :: 0;

size_t :: u64;

SOCKET :: u64;

fd_set :: struct {
    fd_count: u32;
    fd_array: [64] SOCKET;
}

ENetSocket :: SOCKET;

ENetBuffer :: struct {
    dataLength: size_t;
    data:       *void;
}

ENetSocketSet :: fd_set;

enet_uint8 :: u8;
enet_uint16 :: u16;
enet_uint32 :: u32;

ENET_PROTOCOL :: enum s32 {
    MINIMUM_MTU             :: 576;
    MAXIMUM_MTU             :: 4096;
    MAXIMUM_PACKET_COMMANDS :: 32;
    MINIMUM_WINDOW_SIZE     :: 4096;
    MAXIMUM_WINDOW_SIZE     :: 65536;
    MINIMUM_CHANNEL_COUNT   :: 1;
    MAXIMUM_CHANNEL_COUNT   :: 255;
    MAXIMUM_PEER_ID         :: 4095;
    MAXIMUM_FRAGMENT_COUNT  :: 1048576;

    ENET_PROTOCOL_MINIMUM_MTU             :: MINIMUM_MTU;
    ENET_PROTOCOL_MAXIMUM_MTU             :: MAXIMUM_MTU;
    ENET_PROTOCOL_MAXIMUM_PACKET_COMMANDS :: MAXIMUM_PACKET_COMMANDS;
    ENET_PROTOCOL_MINIMUM_WINDOW_SIZE     :: MINIMUM_WINDOW_SIZE;
    ENET_PROTOCOL_MAXIMUM_WINDOW_SIZE     :: MAXIMUM_WINDOW_SIZE;
    ENET_PROTOCOL_MINIMUM_CHANNEL_COUNT   :: MINIMUM_CHANNEL_COUNT;
    ENET_PROTOCOL_MAXIMUM_CHANNEL_COUNT   :: MAXIMUM_CHANNEL_COUNT;
    ENET_PROTOCOL_MAXIMUM_PEER_ID         :: MAXIMUM_PEER_ID;
    ENET_PROTOCOL_MAXIMUM_FRAGMENT_COUNT  :: MAXIMUM_FRAGMENT_COUNT;
}

_ENetProtocolCommand :: enum s32 {
    NONE                     :: 0;
    ACKNOWLEDGE              :: 1;
    CONNECT                  :: 2;
    VERIFY_CONNECT           :: 3;
    DISCONNECT               :: 4;
    PING                     :: 5;
    SEND_RELIABLE            :: 6;
    SEND_UNRELIABLE          :: 7;
    SEND_FRAGMENT            :: 8;
    SEND_UNSEQUENCED         :: 9;
    BANDWIDTH_LIMIT          :: 10;
    THROTTLE_CONFIGURE       :: 11;
    SEND_UNRELIABLE_FRAGMENT :: 12;
    COUNT                    :: 13;

    MASK                     :: 15;

    ENET_PROTOCOL_COMMAND_NONE                     :: NONE;
    ENET_PROTOCOL_COMMAND_ACKNOWLEDGE              :: ACKNOWLEDGE;
    ENET_PROTOCOL_COMMAND_CONNECT                  :: CONNECT;
    ENET_PROTOCOL_COMMAND_VERIFY_CONNECT           :: VERIFY_CONNECT;
    ENET_PROTOCOL_COMMAND_DISCONNECT               :: DISCONNECT;
    ENET_PROTOCOL_COMMAND_PING                     :: PING;
    ENET_PROTOCOL_COMMAND_SEND_RELIABLE            :: SEND_RELIABLE;
    ENET_PROTOCOL_COMMAND_SEND_UNRELIABLE          :: SEND_UNRELIABLE;
    ENET_PROTOCOL_COMMAND_SEND_FRAGMENT            :: SEND_FRAGMENT;
    ENET_PROTOCOL_COMMAND_SEND_UNSEQUENCED         :: SEND_UNSEQUENCED;
    ENET_PROTOCOL_COMMAND_BANDWIDTH_LIMIT          :: BANDWIDTH_LIMIT;
    ENET_PROTOCOL_COMMAND_THROTTLE_CONFIGURE       :: THROTTLE_CONFIGURE;
    ENET_PROTOCOL_COMMAND_SEND_UNRELIABLE_FRAGMENT :: SEND_UNRELIABLE_FRAGMENT;
    ENET_PROTOCOL_COMMAND_COUNT                    :: COUNT;

    ENET_PROTOCOL_COMMAND_MASK                     :: MASK;
}

ENetProtocolCommand :: _ENetProtocolCommand;

_ENetProtocolFlag :: enum s32 {
    COMMAND_FLAG_ACKNOWLEDGE :: 128;
    COMMAND_FLAG_UNSEQUENCED :: 64;

    HEADER_FLAG_COMPRESSED   :: 16384;
    HEADER_FLAG_SENT_TIME    :: 32768;
    HEADER_FLAG_MASK         :: 49152;

    HEADER_SESSION_MASK      :: 12288;
    HEADER_SESSION_SHIFT     :: 12;

    ENET_PROTOCOL_COMMAND_FLAG_ACKNOWLEDGE :: COMMAND_FLAG_ACKNOWLEDGE;
    ENET_PROTOCOL_COMMAND_FLAG_UNSEQUENCED :: COMMAND_FLAG_UNSEQUENCED;

    ENET_PROTOCOL_HEADER_FLAG_COMPRESSED   :: HEADER_FLAG_COMPRESSED;
    ENET_PROTOCOL_HEADER_FLAG_SENT_TIME    :: HEADER_FLAG_SENT_TIME;
    ENET_PROTOCOL_HEADER_FLAG_MASK         :: HEADER_FLAG_MASK;

    ENET_PROTOCOL_HEADER_SESSION_MASK      :: HEADER_SESSION_MASK;
    ENET_PROTOCOL_HEADER_SESSION_SHIFT     :: HEADER_SESSION_SHIFT;
}

ENetProtocolFlag :: _ENetProtocolFlag;

_ENetProtocolHeader :: struct {
    peerID:   enet_uint16;
    sentTime: enet_uint16;
}

ENetProtocolHeader :: _ENetProtocolHeader;

_ENetProtocolCommandHeader :: struct {
    command:                enet_uint8;
    channelID:              enet_uint8;
    reliableSequenceNumber: enet_uint16;
}

ENetProtocolCommandHeader :: _ENetProtocolCommandHeader;

_ENetProtocolAcknowledge :: struct {
    header:                         ENetProtocolCommandHeader;
    receivedReliableSequenceNumber: enet_uint16;
    receivedSentTime:               enet_uint16;
}

ENetProtocolAcknowledge :: _ENetProtocolAcknowledge;

_ENetProtocolConnect :: struct {
    header:                     ENetProtocolCommandHeader;
    outgoingPeerID:             enet_uint16;
    incomingSessionID:          enet_uint8;
    outgoingSessionID:          enet_uint8;
    mtu:                        enet_uint32;
    windowSize:                 enet_uint32;
    channelCount:               enet_uint32;
    incomingBandwidth:          enet_uint32;
    outgoingBandwidth:          enet_uint32;
    packetThrottleInterval:     enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
    connectID:                  enet_uint32;
    data:                       enet_uint32;
}

ENetProtocolConnect :: _ENetProtocolConnect;

_ENetProtocolVerifyConnect :: struct {
    header:                     ENetProtocolCommandHeader;
    outgoingPeerID:             enet_uint16;
    incomingSessionID:          enet_uint8;
    outgoingSessionID:          enet_uint8;
    mtu:                        enet_uint32;
    windowSize:                 enet_uint32;
    channelCount:               enet_uint32;
    incomingBandwidth:          enet_uint32;
    outgoingBandwidth:          enet_uint32;
    packetThrottleInterval:     enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
    connectID:                  enet_uint32;
}

ENetProtocolVerifyConnect :: _ENetProtocolVerifyConnect;

_ENetProtocolBandwidthLimit :: struct {
    header:            ENetProtocolCommandHeader;
    incomingBandwidth: enet_uint32;
    outgoingBandwidth: enet_uint32;
}

ENetProtocolBandwidthLimit :: _ENetProtocolBandwidthLimit;

_ENetProtocolThrottleConfigure :: struct {
    header:                     ENetProtocolCommandHeader;
    packetThrottleInterval:     enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
}

ENetProtocolThrottleConfigure :: _ENetProtocolThrottleConfigure;

_ENetProtocolDisconnect :: struct {
    header: ENetProtocolCommandHeader;
    data:   enet_uint32;
}

ENetProtocolDisconnect :: _ENetProtocolDisconnect;

_ENetProtocolPing :: struct {
    header: ENetProtocolCommandHeader;
}

ENetProtocolPing :: _ENetProtocolPing;

_ENetProtocolSendReliable :: struct {
    header:     ENetProtocolCommandHeader;
    dataLength: enet_uint16;
}

ENetProtocolSendReliable :: _ENetProtocolSendReliable;

_ENetProtocolSendUnreliable :: struct {
    header:                   ENetProtocolCommandHeader;
    unreliableSequenceNumber: enet_uint16;
    dataLength:               enet_uint16;
}

ENetProtocolSendUnreliable :: _ENetProtocolSendUnreliable;

_ENetProtocolSendUnsequenced :: struct {
    header:           ENetProtocolCommandHeader;
    unsequencedGroup: enet_uint16;
    dataLength:       enet_uint16;
}

ENetProtocolSendUnsequenced :: _ENetProtocolSendUnsequenced;

_ENetProtocolSendFragment :: struct {
    header:              ENetProtocolCommandHeader;
    startSequenceNumber: enet_uint16;
    dataLength:          enet_uint16;
    fragmentCount:       enet_uint32;
    fragmentNumber:      enet_uint32;
    totalLength:         enet_uint32;
    fragmentOffset:      enet_uint32;
}

ENetProtocolSendFragment :: _ENetProtocolSendFragment;

_ENetProtocol :: union {
    header:            ENetProtocolCommandHeader;
    acknowledge:       ENetProtocolAcknowledge;
    connect:           ENetProtocolConnect;
    verifyConnect:     ENetProtocolVerifyConnect;
    disconnect:        ENetProtocolDisconnect;
    ping:              ENetProtocolPing;
    sendReliable:      ENetProtocolSendReliable;
    sendUnreliable:    ENetProtocolSendUnreliable;
    sendUnsequenced:   ENetProtocolSendUnsequenced;
    sendFragment:      ENetProtocolSendFragment;
    bandwidthLimit:    ENetProtocolBandwidthLimit;
    throttleConfigure: ENetProtocolThrottleConfigure;
}

ENetProtocol :: _ENetProtocol;

_ENetListNode :: struct {
    next:     *_ENetListNode;
    previous: *_ENetListNode;
}

ENetListNode :: _ENetListNode;

ENetListIterator :: *ENetListNode;

_ENetList :: struct {
    sentinel: ENetListNode;
}

ENetList :: _ENetList;

_ENetCallbacks :: struct {
    malloc:    #type (size: size_t) -> *void #c_call;
    free:      #type (memory: *void) -> void #c_call;
    no_memory: #type () -> void #c_call;
}

ENetCallbacks :: _ENetCallbacks;

ENetVersion :: enet_uint32;

_ENetSocketType :: enum s32 {
    STREAM   :: 1;
    DATAGRAM :: 2;

    ENET_SOCKET_TYPE_STREAM   :: STREAM;
    ENET_SOCKET_TYPE_DATAGRAM :: DATAGRAM;
}

ENetSocketType :: _ENetSocketType;

_ENetSocketWait :: enum s32 {
    NONE      :: 0;
    SEND      :: 1;
    RECEIVE   :: 2;
    INTERRUPT :: 4;

    ENET_SOCKET_WAIT_NONE      :: NONE;
    ENET_SOCKET_WAIT_SEND      :: SEND;
    ENET_SOCKET_WAIT_RECEIVE   :: RECEIVE;
    ENET_SOCKET_WAIT_INTERRUPT :: INTERRUPT;
}

ENetSocketWait :: _ENetSocketWait;

_ENetSocketOption :: enum s32 {
    NONBLOCK  :: 1;
    BROADCAST :: 2;
    RCVBUF    :: 3;
    SNDBUF    :: 4;
    REUSEADDR :: 5;
    RCVTIMEO  :: 6;
    SNDTIMEO  :: 7;
    ERROR     :: 8;
    NODELAY   :: 9;
    TTL       :: 10;

    ENET_SOCKOPT_NONBLOCK  :: NONBLOCK;
    ENET_SOCKOPT_BROADCAST :: BROADCAST;
    ENET_SOCKOPT_RCVBUF    :: RCVBUF;
    ENET_SOCKOPT_SNDBUF    :: SNDBUF;
    ENET_SOCKOPT_REUSEADDR :: REUSEADDR;
    ENET_SOCKOPT_RCVTIMEO  :: RCVTIMEO;
    ENET_SOCKOPT_SNDTIMEO  :: SNDTIMEO;
    ENET_SOCKOPT_ERROR     :: ERROR;
    ENET_SOCKOPT_NODELAY   :: NODELAY;
    ENET_SOCKOPT_TTL       :: TTL;
}

ENetSocketOption :: _ENetSocketOption;

_ENetSocketShutdown :: enum s32 {
    READ       :: 0;
    WRITE      :: 1;
    READ_WRITE :: 2;

    ENET_SOCKET_SHUTDOWN_READ       :: READ;
    ENET_SOCKET_SHUTDOWN_WRITE      :: WRITE;
    ENET_SOCKET_SHUTDOWN_READ_WRITE :: READ_WRITE;
}

ENetSocketShutdown :: _ENetSocketShutdown;

/**
* Portable internet address structure.
*
* The host must be specified in network byte-order, and the port must be in host
* byte-order. The constant ENET_HOST_ANY may be used to specify the default
* server host. The constant ENET_HOST_BROADCAST may be used to specify the
* broadcast address (255.255.255.255).  This makes sense for enet_host_connect,
* but not for enet_host_create.  Once a server responds to a broadcast, the
* address is updated from ENET_HOST_BROADCAST to the server's actual IP address.
*/
_ENetAddress :: struct {
    host: enet_uint32;
    port: enet_uint16;
}

/**
* Portable internet address structure.
*
* The host must be specified in network byte-order, and the port must be in host
* byte-order. The constant ENET_HOST_ANY may be used to specify the default
* server host. The constant ENET_HOST_BROADCAST may be used to specify the
* broadcast address (255.255.255.255).  This makes sense for enet_host_connect,
* but not for enet_host_create.  Once a server responds to a broadcast, the
* address is updated from ENET_HOST_BROADCAST to the server's actual IP address.
*/
ENetAddress :: _ENetAddress;

/**
* Packet flag bit constants.
*
* The host must be specified in network byte-order, and the port must be in
* host byte-order. The constant ENET_HOST_ANY may be used to specify the
* default server host.

@sa ENetPacket
*/
_ENetPacketFlag :: enum s32 {
    RELIABLE            :: 1;

    UNSEQUENCED         :: 2;

    NO_ALLOCATE         :: 4;

    UNRELIABLE_FRAGMENT :: 8;

    SENT                :: 256;

    ENET_PACKET_FLAG_RELIABLE            :: RELIABLE;

    ENET_PACKET_FLAG_UNSEQUENCED         :: UNSEQUENCED;

    ENET_PACKET_FLAG_NO_ALLOCATE         :: NO_ALLOCATE;

    ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT :: UNRELIABLE_FRAGMENT;

    ENET_PACKET_FLAG_SENT                :: SENT;
}

/**
* Packet flag bit constants.
*
* The host must be specified in network byte-order, and the port must be in
* host byte-order. The constant ENET_HOST_ANY may be used to specify the
* default server host.

@sa ENetPacket
*/
ENetPacketFlag :: _ENetPacketFlag;

ENetPacketFreeCallback :: #type (unknown0: *_ENetPacket) -> void #c_call;

/**
* ENet packet structure.
*
* An ENet data packet that may be sent to or received from a peer. The shown
* fields should only be read and never modified. The data field contains the
* allocated data for the packet. The dataLength fields specifies the length
* of the allocated data.  The flags field is either 0 (specifying no flags),
* or a bitwise-or of any combination of the following flags:
*
*    ENET_PACKET_FLAG_RELIABLE - packet must be received by the target peer
*    and resend attempts should be made until the packet is delivered
*
*    ENET_PACKET_FLAG_UNSEQUENCED - packet will not be sequenced with other packets
*    (not supported for reliable packets)
*
*    ENET_PACKET_FLAG_NO_ALLOCATE - packet will not allocate data, and user must supply it instead
*
*    ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT - packet will be fragmented using unreliable
*    (instead of reliable) sends if it exceeds the MTU
*
*    ENET_PACKET_FLAG_SENT - whether the packet has been sent from all queues it has been entered into
@sa ENetPacketFlag
*/
_ENetPacket :: struct {
    referenceCount: size_t; /**< internal use only */
    flags:          enet_uint32; /**< bitwise-or of ENetPacketFlag constants */
    data:           *enet_uint8; /**< allocated data for packet */
    dataLength:     size_t; /**< length of data */
    freeCallback:   ENetPacketFreeCallback; /**< function to be called when the packet is no longer in use */
    userData:       *void; /**< application private data, may be freely modified */
}

/**
* ENet packet structure.
*
* An ENet data packet that may be sent to or received from a peer. The shown
* fields should only be read and never modified. The data field contains the
* allocated data for the packet. The dataLength fields specifies the length
* of the allocated data.  The flags field is either 0 (specifying no flags),
* or a bitwise-or of any combination of the following flags:
*
*    ENET_PACKET_FLAG_RELIABLE - packet must be received by the target peer
*    and resend attempts should be made until the packet is delivered
*
*    ENET_PACKET_FLAG_UNSEQUENCED - packet will not be sequenced with other packets
*    (not supported for reliable packets)
*
*    ENET_PACKET_FLAG_NO_ALLOCATE - packet will not allocate data, and user must supply it instead
*
*    ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT - packet will be fragmented using unreliable
*    (instead of reliable) sends if it exceeds the MTU
*
*    ENET_PACKET_FLAG_SENT - whether the packet has been sent from all queues it has been entered into
@sa ENetPacketFlag
*/
ENetPacket :: _ENetPacket;

_ENetAcknowledgement :: struct {
    acknowledgementList: ENetListNode;
    sentTime:            enet_uint32;
    command:             ENetProtocol;
}

ENetAcknowledgement :: _ENetAcknowledgement;

_ENetOutgoingCommand :: struct {
    outgoingCommandList:      ENetListNode;
    reliableSequenceNumber:   enet_uint16;
    unreliableSequenceNumber: enet_uint16;
    sentTime:                 enet_uint32;
    roundTripTimeout:         enet_uint32;
    queueTime:                enet_uint32;
    fragmentOffset:           enet_uint32;
    fragmentLength:           enet_uint16;
    sendAttempts:             enet_uint16;
    command:                  ENetProtocol;
    packet:                   *ENetPacket;
}

ENetOutgoingCommand :: _ENetOutgoingCommand;

_ENetIncomingCommand :: struct {
    incomingCommandList:      ENetListNode;
    reliableSequenceNumber:   enet_uint16;
    unreliableSequenceNumber: enet_uint16;
    command:                  ENetProtocol;
    fragmentCount:            enet_uint32;
    fragmentsRemaining:       enet_uint32;
    fragments:                *enet_uint32;
    packet:                   *ENetPacket;
}

ENetIncomingCommand :: _ENetIncomingCommand;

_ENetPeerState :: enum s32 {
    DISCONNECTED             :: 0;
    CONNECTING               :: 1;
    ACKNOWLEDGING_CONNECT    :: 2;
    CONNECTION_PENDING       :: 3;
    CONNECTION_SUCCEEDED     :: 4;
    CONNECTED                :: 5;
    DISCONNECT_LATER         :: 6;
    DISCONNECTING            :: 7;
    ACKNOWLEDGING_DISCONNECT :: 8;
    ZOMBIE                   :: 9;

    ENET_PEER_STATE_DISCONNECTED             :: DISCONNECTED;
    ENET_PEER_STATE_CONNECTING               :: CONNECTING;
    ENET_PEER_STATE_ACKNOWLEDGING_CONNECT    :: ACKNOWLEDGING_CONNECT;
    ENET_PEER_STATE_CONNECTION_PENDING       :: CONNECTION_PENDING;
    ENET_PEER_STATE_CONNECTION_SUCCEEDED     :: CONNECTION_SUCCEEDED;
    ENET_PEER_STATE_CONNECTED                :: CONNECTED;
    ENET_PEER_STATE_DISCONNECT_LATER         :: DISCONNECT_LATER;
    ENET_PEER_STATE_DISCONNECTING            :: DISCONNECTING;
    ENET_PEER_STATE_ACKNOWLEDGING_DISCONNECT :: ACKNOWLEDGING_DISCONNECT;
    ENET_PEER_STATE_ZOMBIE                   :: ZOMBIE;
}

ENetPeerState :: _ENetPeerState;

ENET :: enum s32 {
    HOST_RECEIVE_BUFFER_SIZE          :: 262144;
    HOST_SEND_BUFFER_SIZE             :: 262144;
    HOST_BANDWIDTH_THROTTLE_INTERVAL  :: 1000;
    HOST_DEFAULT_MTU                  :: 1392;
    HOST_DEFAULT_MAXIMUM_PACKET_SIZE  :: 33554432;
    HOST_DEFAULT_MAXIMUM_WAITING_DATA :: 33554432;

    PEER_DEFAULT_ROUND_TRIP_TIME      :: 500;
    PEER_DEFAULT_PACKET_THROTTLE      :: 32;
    PEER_PACKET_THROTTLE_SCALE        :: 32;
    PEER_PACKET_THROTTLE_COUNTER      :: 7;
    PEER_PACKET_THROTTLE_ACCELERATION :: 2;
    PEER_PACKET_THROTTLE_DECELERATION :: 2;
    PEER_PACKET_THROTTLE_INTERVAL     :: 5000;
    PEER_PACKET_LOSS_SCALE            :: 65536;
    PEER_PACKET_LOSS_INTERVAL         :: 10000;
    PEER_WINDOW_SIZE_SCALE            :: 65536;
    PEER_TIMEOUT_LIMIT                :: 32;
    PEER_TIMEOUT_MINIMUM              :: 5000;
    PEER_TIMEOUT_MAXIMUM              :: 30000;
    PEER_PING_INTERVAL                :: 500;
    PEER_UNSEQUENCED_WINDOWS          :: 64;
    PEER_UNSEQUENCED_WINDOW_SIZE      :: 1024;
    PEER_FREE_UNSEQUENCED_WINDOWS     :: 32;
    PEER_RELIABLE_WINDOWS             :: 16;
    PEER_RELIABLE_WINDOW_SIZE         :: 4096;
    PEER_FREE_RELIABLE_WINDOWS        :: 8;

    ENET_HOST_RECEIVE_BUFFER_SIZE          :: HOST_RECEIVE_BUFFER_SIZE;
    ENET_HOST_SEND_BUFFER_SIZE             :: HOST_SEND_BUFFER_SIZE;
    ENET_HOST_BANDWIDTH_THROTTLE_INTERVAL  :: HOST_BANDWIDTH_THROTTLE_INTERVAL;
    ENET_HOST_DEFAULT_MTU                  :: HOST_DEFAULT_MTU;
    ENET_HOST_DEFAULT_MAXIMUM_PACKET_SIZE  :: HOST_DEFAULT_MAXIMUM_PACKET_SIZE;
    ENET_HOST_DEFAULT_MAXIMUM_WAITING_DATA :: HOST_DEFAULT_MAXIMUM_WAITING_DATA;

    ENET_PEER_DEFAULT_ROUND_TRIP_TIME      :: PEER_DEFAULT_ROUND_TRIP_TIME;
    ENET_PEER_DEFAULT_PACKET_THROTTLE      :: PEER_DEFAULT_PACKET_THROTTLE;
    ENET_PEER_PACKET_THROTTLE_SCALE        :: PEER_PACKET_THROTTLE_SCALE;
    ENET_PEER_PACKET_THROTTLE_COUNTER      :: PEER_PACKET_THROTTLE_COUNTER;
    ENET_PEER_PACKET_THROTTLE_ACCELERATION :: PEER_PACKET_THROTTLE_ACCELERATION;
    ENET_PEER_PACKET_THROTTLE_DECELERATION :: PEER_PACKET_THROTTLE_DECELERATION;
    ENET_PEER_PACKET_THROTTLE_INTERVAL     :: PEER_PACKET_THROTTLE_INTERVAL;
    ENET_PEER_PACKET_LOSS_SCALE            :: PEER_PACKET_LOSS_SCALE;
    ENET_PEER_PACKET_LOSS_INTERVAL         :: PEER_PACKET_LOSS_INTERVAL;
    ENET_PEER_WINDOW_SIZE_SCALE            :: PEER_WINDOW_SIZE_SCALE;
    ENET_PEER_TIMEOUT_LIMIT                :: PEER_TIMEOUT_LIMIT;
    ENET_PEER_TIMEOUT_MINIMUM              :: PEER_TIMEOUT_MINIMUM;
    ENET_PEER_TIMEOUT_MAXIMUM              :: PEER_TIMEOUT_MAXIMUM;
    ENET_PEER_PING_INTERVAL                :: PEER_PING_INTERVAL;
    ENET_PEER_UNSEQUENCED_WINDOWS          :: PEER_UNSEQUENCED_WINDOWS;
    ENET_PEER_UNSEQUENCED_WINDOW_SIZE      :: PEER_UNSEQUENCED_WINDOW_SIZE;
    ENET_PEER_FREE_UNSEQUENCED_WINDOWS     :: PEER_FREE_UNSEQUENCED_WINDOWS;
    ENET_PEER_RELIABLE_WINDOWS             :: PEER_RELIABLE_WINDOWS;
    ENET_PEER_RELIABLE_WINDOW_SIZE         :: PEER_RELIABLE_WINDOW_SIZE;
    ENET_PEER_FREE_RELIABLE_WINDOWS        :: PEER_FREE_RELIABLE_WINDOWS;
}

_ENetChannel :: struct {
    outgoingReliableSequenceNumber:   enet_uint16;
    outgoingUnreliableSequenceNumber: enet_uint16;
    usedReliableWindows:              enet_uint16;
    reliableWindows:                  [16] enet_uint16;
    incomingReliableSequenceNumber:   enet_uint16;
    incomingUnreliableSequenceNumber: enet_uint16;
    incomingReliableCommands:         ENetList;
    incomingUnreliableCommands:       ENetList;
}

ENetChannel :: _ENetChannel;

_ENetPeerFlag :: enum s32 {
    NEEDS_DISPATCH   :: 1;
    CONTINUE_SENDING :: 2;

    ENET_PEER_FLAG_NEEDS_DISPATCH   :: NEEDS_DISPATCH;
    ENET_PEER_FLAG_CONTINUE_SENDING :: CONTINUE_SENDING;
}

ENetPeerFlag :: _ENetPeerFlag;

/**
* An ENet peer which data packets may be sent or received from.
*
* No fields should be modified unless otherwise specified.
*/
_ENetPeer :: struct {
    dispatchList:                   ENetListNode;
    host:                           *_ENetHost;
    outgoingPeerID:                 enet_uint16;
    incomingPeerID:                 enet_uint16;
    connectID:                      enet_uint32;
    outgoingSessionID:              enet_uint8;
    incomingSessionID:              enet_uint8;
    address:                        ENetAddress; /**< Internet address of the peer */
    data:                           *void; /**< Application private data, may be freely modified */
    state:                          ENetPeerState;
    channels:                       *ENetChannel;
    channelCount:                   size_t; /**< Number of channels allocated for communication with peer */
    incomingBandwidth:              enet_uint32; /**< Downstream bandwidth of the client in bytes/second */
    outgoingBandwidth:              enet_uint32; /**< Upstream bandwidth of the client in bytes/second */
    incomingBandwidthThrottleEpoch: enet_uint32;
    outgoingBandwidthThrottleEpoch: enet_uint32;
    incomingDataTotal:              enet_uint32;
    outgoingDataTotal:              enet_uint32;
    lastSendTime:                   enet_uint32;
    lastReceiveTime:                enet_uint32;
    nextTimeout:                    enet_uint32;
    earliestTimeout:                enet_uint32;
    packetLossEpoch:                enet_uint32;
    packetsSent:                    enet_uint32;
    packetsLost:                    enet_uint32;
    packetLoss:                     enet_uint32; /**< mean packet loss of reliable packets as a ratio with respect to the constant ENET_PEER_PACKET_LOSS_SCALE */
    packetLossVariance:             enet_uint32;
    packetThrottle:                 enet_uint32;
    packetThrottleLimit:            enet_uint32;
    packetThrottleCounter:          enet_uint32;
    packetThrottleEpoch:            enet_uint32;
    packetThrottleAcceleration:     enet_uint32;
    packetThrottleDeceleration:     enet_uint32;
    packetThrottleInterval:         enet_uint32;
    pingInterval:                   enet_uint32;
    timeoutLimit:                   enet_uint32;
    timeoutMinimum:                 enet_uint32;
    timeoutMaximum:                 enet_uint32;
    lastRoundTripTime:              enet_uint32;
    lowestRoundTripTime:            enet_uint32;
    lastRoundTripTimeVariance:      enet_uint32;
    highestRoundTripTimeVariance:   enet_uint32;
    roundTripTime:                  enet_uint32; /**< mean round trip time (RTT), in milliseconds, between sending a reliable packet and receiving its acknowledgement */
    roundTripTimeVariance:          enet_uint32;
    mtu:                            enet_uint32;
    windowSize:                     enet_uint32;
    reliableDataInTransit:          enet_uint32;
    outgoingReliableSequenceNumber: enet_uint16;
    acknowledgements:               ENetList;
    sentReliableCommands:           ENetList;
    outgoingSendReliableCommands:   ENetList;
    outgoingCommands:               ENetList;
    dispatchedCommands:             ENetList;
    flags:                          enet_uint16;
    reserved:                       enet_uint16;
    incomingUnsequencedGroup:       enet_uint16;
    outgoingUnsequencedGroup:       enet_uint16;
    unsequencedWindow:              [32] enet_uint32;
    eventData:                      enet_uint32;
    totalWaitingData:               size_t;
}

/**
* An ENet peer which data packets may be sent or received from.
*
* No fields should be modified unless otherwise specified.
*/
ENetPeer :: _ENetPeer;

/** An ENet packet compressor for compressing UDP packets before socket sends or receives.
*/
_ENetCompressor :: struct {
    /** Context data for the compressor. Must be non-NULL. */
    _context:   *void;

    /** Compresses from inBuffers[0:inBufferCount-1], containing inLimit bytes, to outData, outputting at most outLimit bytes. Should return 0 on failure. */
    compress:   #type (_context: *void, inBuffers: *ENetBuffer, inBufferCount: size_t, inLimit: size_t, outData: *enet_uint8, outLimit: size_t) -> size_t #c_call;

    /** Decompresses from inData, containing inLimit bytes, to outData, outputting at most outLimit bytes. Should return 0 on failure. */
    decompress: #type (_context: *void, inData: *enet_uint8, inLimit: size_t, outData: *enet_uint8, outLimit: size_t) -> size_t #c_call;

    /** Destroys the context when compression is disabled or the host is destroyed. May be NULL. */
    destroy:    #type (_context: *void) -> void #c_call;
}

/** An ENet packet compressor for compressing UDP packets before socket sends or receives.
*/
ENetCompressor :: _ENetCompressor;

/** Callback that computes the checksum of the data held in buffers[0:bufferCount-1] */
ENetChecksumCallback :: #type (buffers: *ENetBuffer, bufferCount: size_t) -> enet_uint32 #c_call;

/** Callback for intercepting received raw UDP packets. Should return 1 to intercept, 0 to ignore, or -1 to propagate an error. */
ENetInterceptCallback :: #type (host: *_ENetHost, event: *_ENetEvent) -> s32 #c_call;

/** An ENet host for communicating with peers.
*
* No fields should be modified unless otherwise stated.

@sa enet_host_create()
@sa enet_host_destroy()
@sa enet_host_connect()
@sa enet_host_service()
@sa enet_host_flush()
@sa enet_host_broadcast()
@sa enet_host_compress()
@sa enet_host_compress_with_range_coder()
@sa enet_host_channel_limit()
@sa enet_host_bandwidth_limit()
@sa enet_host_bandwidth_throttle()
*/
_ENetHost :: struct {
    socket:                     ENetSocket;
    address:                    ENetAddress; /**< Internet address of the host */
    incomingBandwidth:          enet_uint32; /**< downstream bandwidth of the host */
    outgoingBandwidth:          enet_uint32; /**< upstream bandwidth of the host */
    bandwidthThrottleEpoch:     enet_uint32;
    mtu:                        enet_uint32;
    randomSeed:                 enet_uint32;
    recalculateBandwidthLimits: s32;
    peers:                      *ENetPeer; /**< array of peers allocated for this host */
    peerCount:                  size_t; /**< number of peers allocated for this host */
    channelLimit:               size_t; /**< maximum number of channels allowed for connected peers */
    serviceTime:                enet_uint32;
    dispatchQueue:              ENetList;
    totalQueued:                enet_uint32;
    packetSize:                 size_t;
    headerFlags:                enet_uint16;
    commands:                   [32] ENetProtocol #align 2;
    commandCount:               size_t;
    buffers:                    [65] ENetBuffer;
    bufferCount:                size_t;
    checksum:                   ENetChecksumCallback; /**< callback the user can set to enable packet checksums for this host */
    compressor:                 ENetCompressor;
    packetData:                 [2] [4096] enet_uint8;
    receivedAddress:            ENetAddress;
    receivedData:               *enet_uint8;
    receivedDataLength:         size_t;
    totalSentData:              enet_uint32; /**< total data sent, user should reset to 0 as needed to prevent overflow */
    totalSentPackets:           enet_uint32; /**< total UDP packets sent, user should reset to 0 as needed to prevent overflow */
    totalReceivedData:          enet_uint32; /**< total data received, user should reset to 0 as needed to prevent overflow */
    totalReceivedPackets:       enet_uint32; /**< total UDP packets received, user should reset to 0 as needed to prevent overflow */
    intercept:                  ENetInterceptCallback; /**< callback the user can set to intercept received raw UDP packets */
    connectedPeers:             size_t;
    bandwidthLimitedPeers:      size_t;
    duplicatePeers:             size_t; /**< optional number of allowed peers from duplicate IPs, defaults to ENET_PROTOCOL_MAXIMUM_PEER_ID */
    maximumPacketSize:          size_t; /**< the maximum allowable packet size that may be sent or received on a peer */
    maximumWaitingData:         size_t; /**< the maximum aggregate amount of buffer space a peer may use waiting for packets to be delivered */
}

/** An ENet host for communicating with peers.
*
* No fields should be modified unless otherwise stated.

@sa enet_host_create()
@sa enet_host_destroy()
@sa enet_host_connect()
@sa enet_host_service()
@sa enet_host_flush()
@sa enet_host_broadcast()
@sa enet_host_compress()
@sa enet_host_compress_with_range_coder()
@sa enet_host_channel_limit()
@sa enet_host_bandwidth_limit()
@sa enet_host_bandwidth_throttle()
*/
ENetHost :: _ENetHost;

/**
* An ENet event type, as specified in @ref ENetEvent.
*/
_ENetEventType :: enum s32 {
    NONE       :: 0;

    CONNECT    :: 1;

    DISCONNECT :: 2;

    RECEIVE    :: 3;

    ENET_EVENT_TYPE_NONE       :: NONE;

    ENET_EVENT_TYPE_CONNECT    :: CONNECT;

    ENET_EVENT_TYPE_DISCONNECT :: DISCONNECT;

    ENET_EVENT_TYPE_RECEIVE    :: RECEIVE;
}

/**
* An ENet event type, as specified in @ref ENetEvent.
*/
ENetEventType :: _ENetEventType;

/**
* An ENet event as returned by enet_host_service().

@sa enet_host_service
*/
_ENetEvent :: struct {
    type:      ENetEventType; /**< type of the event */
    peer:      *ENetPeer; /**< peer that generated a connect, disconnect or receive event */
    channelID: enet_uint8; /**< channel on the peer that generated the event, if appropriate */
    data:      enet_uint32; /**< data associated with the event, if appropriate */
    packet:    *ENetPacket; /**< packet associated with the event, if appropriate */
}

/**
* An ENet event as returned by enet_host_service().

@sa enet_host_service
*/
ENetEvent :: _ENetEvent;

/**
Initializes ENet globally.  Must be called prior to using any functions in
ENet.
@returns 0 on success, < 0 on failure
*/
enet_initialize :: () -> s32 #foreign enet;

/**
Initializes ENet globally and supplies user-overridden callbacks. Must be called prior to using any functions in ENet. Do not use enet_initialize() if you use this variant. Make sure the ENetCallbacks structure is zeroed out so that any additional callbacks added in future versions will be properly ignored.

@param version the constant ENET_VERSION should be supplied so ENet knows which version of ENetCallbacks struct to use
@param inits user-overridden callbacks where any NULL callbacks will use ENet's defaults
@returns 0 on success, < 0 on failure
*/
enet_initialize_with_callbacks :: (version: ENetVersion, inits: *ENetCallbacks) -> s32 #foreign enet;

/**
Shuts down ENet globally.  Should be called when a program that has
initialized ENet exits.
*/
enet_deinitialize :: () -> void #foreign enet;

/**
Gives the linked version of the ENet library.
@returns the version number
*/
enet_linked_version :: () -> ENetVersion #foreign enet;

/**
Returns the wall-time in milliseconds.  Its initial value is unspecified
unless otherwise set.
*/
enet_time_get :: () -> enet_uint32 #foreign enet;

/**
Sets the current wall-time in milliseconds.
*/
enet_time_set :: (unknown0: enet_uint32) -> void #foreign enet;

/** @defgroup socket ENet socket functions
@{
*/
enet_socket_create :: (unknown0: ENetSocketType) -> ENetSocket #foreign enet;
enet_socket_bind :: (unknown0: ENetSocket, unknown1: *ENetAddress) -> s32 #foreign enet;
enet_socket_get_address :: (unknown0: ENetSocket, unknown1: *ENetAddress) -> s32 #foreign enet;
enet_socket_listen :: (unknown0: ENetSocket, unknown1: s32) -> s32 #foreign enet;
enet_socket_accept :: (unknown0: ENetSocket, unknown1: *ENetAddress) -> ENetSocket #foreign enet;
enet_socket_connect :: (unknown0: ENetSocket, unknown1: *ENetAddress) -> s32 #foreign enet;
enet_socket_send :: (unknown0: ENetSocket, unknown1: *ENetAddress, unknown2: *ENetBuffer, unknown3: size_t) -> s32 #foreign enet;
enet_socket_receive :: (unknown0: ENetSocket, unknown1: *ENetAddress, unknown2: *ENetBuffer, unknown3: size_t) -> s32 #foreign enet;
enet_socket_wait :: (unknown0: ENetSocket, unknown1: *enet_uint32, unknown2: enet_uint32) -> s32 #foreign enet;
enet_socket_set_option :: (unknown0: ENetSocket, unknown1: ENetSocketOption, unknown2: s32) -> s32 #foreign enet;
enet_socket_get_option :: (unknown0: ENetSocket, unknown1: ENetSocketOption, unknown2: *s32) -> s32 #foreign enet;
enet_socket_shutdown :: (unknown0: ENetSocket, unknown1: ENetSocketShutdown) -> s32 #foreign enet;
enet_socket_destroy :: (unknown0: ENetSocket) -> void #foreign enet;
enet_socketset_select :: (unknown0: ENetSocket, unknown1: *ENetSocketSet, unknown2: *ENetSocketSet, unknown3: enet_uint32) -> s32 #foreign enet;

/** Attempts to parse the printable form of the IP address in the parameter hostName
and sets the host field in the address parameter if successful.
@param address destination to store the parsed IP address
@param hostName IP address to parse
@retval 0 on success
@retval < 0 on failure
@returns the address of the given hostName in address on success
*/
enet_address_set_host_ip :: (address: *ENetAddress, hostName: *u8) -> s32 #foreign enet;

/** Attempts to resolve the host named by the parameter hostName and sets
the host field in the address parameter if successful.
@param address destination to store resolved address
@param hostName host name to lookup
@retval 0 on success
@retval < 0 on failure
@returns the address of the given hostName in address on success
*/
enet_address_set_host :: (address: *ENetAddress, hostName: *u8) -> s32 #foreign enet;

/** Gives the printable form of the IP address specified in the address parameter.
@param address    address printed
@param hostName   destination for name, must not be NULL
@param nameLength maximum length of hostName.
@returns the null-terminated name of the host in hostName on success
@retval 0 on success
@retval < 0 on failure
*/
enet_address_get_host_ip :: (address: *ENetAddress, hostName: *u8, nameLength: size_t) -> s32 #foreign enet;

/** Attempts to do a reverse lookup of the host field in the address parameter.
@param address    address used for reverse lookup
@param hostName   destination for name, must not be NULL
@param nameLength maximum length of hostName.
@returns the null-terminated name of the host in hostName on success
@retval 0 on success
@retval < 0 on failure
*/
enet_address_get_host :: (address: *ENetAddress, hostName: *u8, nameLength: size_t) -> s32 #foreign enet;

/** @} */
enet_packet_create :: (unknown0: *void, unknown1: size_t, unknown2: enet_uint32) -> *ENetPacket #foreign enet;
enet_packet_destroy :: (unknown0: *ENetPacket) -> void #foreign enet;
enet_packet_resize :: (unknown0: *ENetPacket, unknown1: size_t) -> s32 #foreign enet;
enet_crc32 :: (unknown0: *ENetBuffer, unknown1: size_t) -> enet_uint32 #foreign enet;

enet_host_create :: (unknown0: *ENetAddress, unknown1: size_t, unknown2: size_t, unknown3: enet_uint32, unknown4: enet_uint32) -> *ENetHost #foreign enet;
enet_host_destroy :: (unknown0: *ENetHost) -> void #foreign enet;
enet_host_connect :: (unknown0: *ENetHost, unknown1: *ENetAddress, unknown2: size_t, unknown3: enet_uint32) -> *ENetPeer #foreign enet;
enet_host_check_events :: (unknown0: *ENetHost, unknown1: *ENetEvent) -> s32 #foreign enet;
enet_host_service :: (unknown0: *ENetHost, unknown1: *ENetEvent, unknown2: enet_uint32) -> s32 #foreign enet;
enet_host_flush :: (unknown0: *ENetHost) -> void #foreign enet;
enet_host_broadcast :: (unknown0: *ENetHost, unknown1: enet_uint8, unknown2: *ENetPacket) -> void #foreign enet;
enet_host_compress :: (unknown0: *ENetHost, unknown1: *ENetCompressor) -> void #foreign enet;
enet_host_compress_with_range_coder :: (host: *ENetHost) -> s32 #foreign enet;
enet_host_channel_limit :: (unknown0: *ENetHost, unknown1: size_t) -> void #foreign enet;
enet_host_bandwidth_limit :: (unknown0: *ENetHost, unknown1: enet_uint32, unknown2: enet_uint32) -> void #foreign enet;

enet_peer_send :: (unknown0: *ENetPeer, unknown1: enet_uint8, unknown2: *ENetPacket) -> s32 #foreign enet;
enet_peer_receive :: (unknown0: *ENetPeer, channelID: *enet_uint8) -> *ENetPacket #foreign enet;
enet_peer_ping :: (unknown0: *ENetPeer) -> void #foreign enet;
enet_peer_ping_interval :: (unknown0: *ENetPeer, unknown1: enet_uint32) -> void #foreign enet;
enet_peer_timeout :: (unknown0: *ENetPeer, unknown1: enet_uint32, unknown2: enet_uint32, unknown3: enet_uint32) -> void #foreign enet;
enet_peer_reset :: (unknown0: *ENetPeer) -> void #foreign enet;
enet_peer_disconnect :: (unknown0: *ENetPeer, unknown1: enet_uint32) -> void #foreign enet;
enet_peer_disconnect_now :: (unknown0: *ENetPeer, unknown1: enet_uint32) -> void #foreign enet;
enet_peer_disconnect_later :: (unknown0: *ENetPeer, unknown1: enet_uint32) -> void #foreign enet;
enet_peer_throttle_configure :: (unknown0: *ENetPeer, unknown1: enet_uint32, unknown2: enet_uint32, unknown3: enet_uint32) -> void #foreign enet;

enet_range_coder_create :: () -> *void #foreign enet;
enet_range_coder_destroy :: (unknown0: *void) -> void #foreign enet;
enet_range_coder_compress :: (unknown0: *void, unknown1: *ENetBuffer, unknown2: size_t, unknown3: size_t, unknown4: *enet_uint8, unknown5: size_t) -> size_t #foreign enet;
enet_range_coder_decompress :: (unknown0: *void, unknown1: *enet_uint8, unknown2: size_t, unknown3: *enet_uint8, unknown4: size_t) -> size_t #foreign enet;

#scope_file

#import "Basic"; // For assert

winmm :: #system_library "winmm";
ws2_32 :: #system_library "ws2_32";
enet :: #library "win/enet";

#run {
    {
        instance: fd_set;
        assert(((cast(*void)(*instance.fd_count)) - cast(*void)(*instance)) == 0, "fd_set.fd_count has unexpected offset % instead of 0", ((cast(*void)(*instance.fd_count)) - cast(*void)(*instance)));
        assert(size_of(type_of(fd_set.fd_count)) == 4, "fd_set.fd_count has unexpected size % instead of 4", size_of(type_of(fd_set.fd_count)));
        assert(((cast(*void)(*instance.fd_array)) - cast(*void)(*instance)) == 8, "fd_set.fd_array has unexpected offset % instead of 8", ((cast(*void)(*instance.fd_array)) - cast(*void)(*instance)));
        assert(size_of(type_of(fd_set.fd_array)) == 512, "fd_set.fd_array has unexpected size % instead of 512", size_of(type_of(fd_set.fd_array)));
        assert(size_of(fd_set) == 520, "fd_set has size % instead of 520", size_of(fd_set));
    }

    {
        instance: ENetBuffer;
        assert(((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)) == 0, "ENetBuffer.dataLength has unexpected offset % instead of 0", ((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(ENetBuffer.dataLength)) == 8, "ENetBuffer.dataLength has unexpected size % instead of 8", size_of(type_of(ENetBuffer.dataLength)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 8, "ENetBuffer.data has unexpected offset % instead of 8", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(ENetBuffer.data)) == 8, "ENetBuffer.data has unexpected size % instead of 8", size_of(type_of(ENetBuffer.data)));
        assert(size_of(ENetBuffer) == 16, "ENetBuffer has size % instead of 16", size_of(ENetBuffer));
    }

    {
        instance: _ENetProtocolHeader;
        assert(((cast(*void)(*instance.peerID)) - cast(*void)(*instance)) == 0, "_ENetProtocolHeader.peerID has unexpected offset % instead of 0", ((cast(*void)(*instance.peerID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolHeader.peerID)) == 2, "_ENetProtocolHeader.peerID has unexpected size % instead of 2", size_of(type_of(_ENetProtocolHeader.peerID)));
        assert(((cast(*void)(*instance.sentTime)) - cast(*void)(*instance)) == 2, "_ENetProtocolHeader.sentTime has unexpected offset % instead of 2", ((cast(*void)(*instance.sentTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolHeader.sentTime)) == 2, "_ENetProtocolHeader.sentTime has unexpected size % instead of 2", size_of(type_of(_ENetProtocolHeader.sentTime)));
        assert(size_of(_ENetProtocolHeader) == 4, "_ENetProtocolHeader has size % instead of 4", size_of(_ENetProtocolHeader));
    }

    {
        instance: _ENetProtocolCommandHeader;
        assert(((cast(*void)(*instance.command)) - cast(*void)(*instance)) == 0, "_ENetProtocolCommandHeader.command has unexpected offset % instead of 0", ((cast(*void)(*instance.command)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolCommandHeader.command)) == 1, "_ENetProtocolCommandHeader.command has unexpected size % instead of 1", size_of(type_of(_ENetProtocolCommandHeader.command)));
        assert(((cast(*void)(*instance.channelID)) - cast(*void)(*instance)) == 1, "_ENetProtocolCommandHeader.channelID has unexpected offset % instead of 1", ((cast(*void)(*instance.channelID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolCommandHeader.channelID)) == 1, "_ENetProtocolCommandHeader.channelID has unexpected size % instead of 1", size_of(type_of(_ENetProtocolCommandHeader.channelID)));
        assert(((cast(*void)(*instance.reliableSequenceNumber)) - cast(*void)(*instance)) == 2, "_ENetProtocolCommandHeader.reliableSequenceNumber has unexpected offset % instead of 2", ((cast(*void)(*instance.reliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolCommandHeader.reliableSequenceNumber)) == 2, "_ENetProtocolCommandHeader.reliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetProtocolCommandHeader.reliableSequenceNumber)));
        assert(size_of(_ENetProtocolCommandHeader) == 4, "_ENetProtocolCommandHeader has size % instead of 4", size_of(_ENetProtocolCommandHeader));
    }

    {
        instance: _ENetProtocolAcknowledge;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolAcknowledge.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolAcknowledge.header)) == 4, "_ENetProtocolAcknowledge.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolAcknowledge.header)));
        assert(((cast(*void)(*instance.receivedReliableSequenceNumber)) - cast(*void)(*instance)) == 4, "_ENetProtocolAcknowledge.receivedReliableSequenceNumber has unexpected offset % instead of 4", ((cast(*void)(*instance.receivedReliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolAcknowledge.receivedReliableSequenceNumber)) == 2, "_ENetProtocolAcknowledge.receivedReliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetProtocolAcknowledge.receivedReliableSequenceNumber)));
        assert(((cast(*void)(*instance.receivedSentTime)) - cast(*void)(*instance)) == 6, "_ENetProtocolAcknowledge.receivedSentTime has unexpected offset % instead of 6", ((cast(*void)(*instance.receivedSentTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolAcknowledge.receivedSentTime)) == 2, "_ENetProtocolAcknowledge.receivedSentTime has unexpected size % instead of 2", size_of(type_of(_ENetProtocolAcknowledge.receivedSentTime)));
        assert(size_of(_ENetProtocolAcknowledge) == 8, "_ENetProtocolAcknowledge has size % instead of 8", size_of(_ENetProtocolAcknowledge));
    }

    {
        instance: _ENetProtocolConnect;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolConnect.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.header)) == 4, "_ENetProtocolConnect.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.header)));
        assert(((cast(*void)(*instance.outgoingPeerID)) - cast(*void)(*instance)) == 4, "_ENetProtocolConnect.outgoingPeerID has unexpected offset % instead of 4", ((cast(*void)(*instance.outgoingPeerID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.outgoingPeerID)) == 2, "_ENetProtocolConnect.outgoingPeerID has unexpected size % instead of 2", size_of(type_of(_ENetProtocolConnect.outgoingPeerID)));
        assert(((cast(*void)(*instance.incomingSessionID)) - cast(*void)(*instance)) == 6, "_ENetProtocolConnect.incomingSessionID has unexpected offset % instead of 6", ((cast(*void)(*instance.incomingSessionID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.incomingSessionID)) == 1, "_ENetProtocolConnect.incomingSessionID has unexpected size % instead of 1", size_of(type_of(_ENetProtocolConnect.incomingSessionID)));
        assert(((cast(*void)(*instance.outgoingSessionID)) - cast(*void)(*instance)) == 7, "_ENetProtocolConnect.outgoingSessionID has unexpected offset % instead of 7", ((cast(*void)(*instance.outgoingSessionID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.outgoingSessionID)) == 1, "_ENetProtocolConnect.outgoingSessionID has unexpected size % instead of 1", size_of(type_of(_ENetProtocolConnect.outgoingSessionID)));
        assert(((cast(*void)(*instance.mtu)) - cast(*void)(*instance)) == 8, "_ENetProtocolConnect.mtu has unexpected offset % instead of 8", ((cast(*void)(*instance.mtu)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.mtu)) == 4, "_ENetProtocolConnect.mtu has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.mtu)));
        assert(((cast(*void)(*instance.windowSize)) - cast(*void)(*instance)) == 12, "_ENetProtocolConnect.windowSize has unexpected offset % instead of 12", ((cast(*void)(*instance.windowSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.windowSize)) == 4, "_ENetProtocolConnect.windowSize has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.windowSize)));
        assert(((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)) == 16, "_ENetProtocolConnect.channelCount has unexpected offset % instead of 16", ((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.channelCount)) == 4, "_ENetProtocolConnect.channelCount has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.channelCount)));
        assert(((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)) == 20, "_ENetProtocolConnect.incomingBandwidth has unexpected offset % instead of 20", ((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.incomingBandwidth)) == 4, "_ENetProtocolConnect.incomingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.incomingBandwidth)));
        assert(((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)) == 24, "_ENetProtocolConnect.outgoingBandwidth has unexpected offset % instead of 24", ((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.outgoingBandwidth)) == 4, "_ENetProtocolConnect.outgoingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.outgoingBandwidth)));
        assert(((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)) == 28, "_ENetProtocolConnect.packetThrottleInterval has unexpected offset % instead of 28", ((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.packetThrottleInterval)) == 4, "_ENetProtocolConnect.packetThrottleInterval has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.packetThrottleInterval)));
        assert(((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)) == 32, "_ENetProtocolConnect.packetThrottleAcceleration has unexpected offset % instead of 32", ((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.packetThrottleAcceleration)) == 4, "_ENetProtocolConnect.packetThrottleAcceleration has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.packetThrottleAcceleration)));
        assert(((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)) == 36, "_ENetProtocolConnect.packetThrottleDeceleration has unexpected offset % instead of 36", ((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.packetThrottleDeceleration)) == 4, "_ENetProtocolConnect.packetThrottleDeceleration has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.packetThrottleDeceleration)));
        assert(((cast(*void)(*instance.connectID)) - cast(*void)(*instance)) == 40, "_ENetProtocolConnect.connectID has unexpected offset % instead of 40", ((cast(*void)(*instance.connectID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.connectID)) == 4, "_ENetProtocolConnect.connectID has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.connectID)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 44, "_ENetProtocolConnect.data has unexpected offset % instead of 44", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolConnect.data)) == 4, "_ENetProtocolConnect.data has unexpected size % instead of 4", size_of(type_of(_ENetProtocolConnect.data)));
        assert(size_of(_ENetProtocolConnect) == 48, "_ENetProtocolConnect has size % instead of 48", size_of(_ENetProtocolConnect));
    }

    {
        instance: _ENetProtocolVerifyConnect;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolVerifyConnect.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.header)) == 4, "_ENetProtocolVerifyConnect.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.header)));
        assert(((cast(*void)(*instance.outgoingPeerID)) - cast(*void)(*instance)) == 4, "_ENetProtocolVerifyConnect.outgoingPeerID has unexpected offset % instead of 4", ((cast(*void)(*instance.outgoingPeerID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.outgoingPeerID)) == 2, "_ENetProtocolVerifyConnect.outgoingPeerID has unexpected size % instead of 2", size_of(type_of(_ENetProtocolVerifyConnect.outgoingPeerID)));
        assert(((cast(*void)(*instance.incomingSessionID)) - cast(*void)(*instance)) == 6, "_ENetProtocolVerifyConnect.incomingSessionID has unexpected offset % instead of 6", ((cast(*void)(*instance.incomingSessionID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.incomingSessionID)) == 1, "_ENetProtocolVerifyConnect.incomingSessionID has unexpected size % instead of 1", size_of(type_of(_ENetProtocolVerifyConnect.incomingSessionID)));
        assert(((cast(*void)(*instance.outgoingSessionID)) - cast(*void)(*instance)) == 7, "_ENetProtocolVerifyConnect.outgoingSessionID has unexpected offset % instead of 7", ((cast(*void)(*instance.outgoingSessionID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.outgoingSessionID)) == 1, "_ENetProtocolVerifyConnect.outgoingSessionID has unexpected size % instead of 1", size_of(type_of(_ENetProtocolVerifyConnect.outgoingSessionID)));
        assert(((cast(*void)(*instance.mtu)) - cast(*void)(*instance)) == 8, "_ENetProtocolVerifyConnect.mtu has unexpected offset % instead of 8", ((cast(*void)(*instance.mtu)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.mtu)) == 4, "_ENetProtocolVerifyConnect.mtu has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.mtu)));
        assert(((cast(*void)(*instance.windowSize)) - cast(*void)(*instance)) == 12, "_ENetProtocolVerifyConnect.windowSize has unexpected offset % instead of 12", ((cast(*void)(*instance.windowSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.windowSize)) == 4, "_ENetProtocolVerifyConnect.windowSize has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.windowSize)));
        assert(((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)) == 16, "_ENetProtocolVerifyConnect.channelCount has unexpected offset % instead of 16", ((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.channelCount)) == 4, "_ENetProtocolVerifyConnect.channelCount has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.channelCount)));
        assert(((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)) == 20, "_ENetProtocolVerifyConnect.incomingBandwidth has unexpected offset % instead of 20", ((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.incomingBandwidth)) == 4, "_ENetProtocolVerifyConnect.incomingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.incomingBandwidth)));
        assert(((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)) == 24, "_ENetProtocolVerifyConnect.outgoingBandwidth has unexpected offset % instead of 24", ((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.outgoingBandwidth)) == 4, "_ENetProtocolVerifyConnect.outgoingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.outgoingBandwidth)));
        assert(((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)) == 28, "_ENetProtocolVerifyConnect.packetThrottleInterval has unexpected offset % instead of 28", ((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.packetThrottleInterval)) == 4, "_ENetProtocolVerifyConnect.packetThrottleInterval has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.packetThrottleInterval)));
        assert(((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)) == 32, "_ENetProtocolVerifyConnect.packetThrottleAcceleration has unexpected offset % instead of 32", ((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.packetThrottleAcceleration)) == 4, "_ENetProtocolVerifyConnect.packetThrottleAcceleration has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.packetThrottleAcceleration)));
        assert(((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)) == 36, "_ENetProtocolVerifyConnect.packetThrottleDeceleration has unexpected offset % instead of 36", ((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.packetThrottleDeceleration)) == 4, "_ENetProtocolVerifyConnect.packetThrottleDeceleration has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.packetThrottleDeceleration)));
        assert(((cast(*void)(*instance.connectID)) - cast(*void)(*instance)) == 40, "_ENetProtocolVerifyConnect.connectID has unexpected offset % instead of 40", ((cast(*void)(*instance.connectID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolVerifyConnect.connectID)) == 4, "_ENetProtocolVerifyConnect.connectID has unexpected size % instead of 4", size_of(type_of(_ENetProtocolVerifyConnect.connectID)));
        assert(size_of(_ENetProtocolVerifyConnect) == 44, "_ENetProtocolVerifyConnect has size % instead of 44", size_of(_ENetProtocolVerifyConnect));
    }

    {
        instance: _ENetProtocolBandwidthLimit;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolBandwidthLimit.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolBandwidthLimit.header)) == 4, "_ENetProtocolBandwidthLimit.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolBandwidthLimit.header)));
        assert(((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)) == 4, "_ENetProtocolBandwidthLimit.incomingBandwidth has unexpected offset % instead of 4", ((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolBandwidthLimit.incomingBandwidth)) == 4, "_ENetProtocolBandwidthLimit.incomingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetProtocolBandwidthLimit.incomingBandwidth)));
        assert(((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)) == 8, "_ENetProtocolBandwidthLimit.outgoingBandwidth has unexpected offset % instead of 8", ((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolBandwidthLimit.outgoingBandwidth)) == 4, "_ENetProtocolBandwidthLimit.outgoingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetProtocolBandwidthLimit.outgoingBandwidth)));
        assert(size_of(_ENetProtocolBandwidthLimit) == 12, "_ENetProtocolBandwidthLimit has size % instead of 12", size_of(_ENetProtocolBandwidthLimit));
    }

    {
        instance: _ENetProtocolThrottleConfigure;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolThrottleConfigure.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolThrottleConfigure.header)) == 4, "_ENetProtocolThrottleConfigure.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolThrottleConfigure.header)));
        assert(((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)) == 4, "_ENetProtocolThrottleConfigure.packetThrottleInterval has unexpected offset % instead of 4", ((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolThrottleConfigure.packetThrottleInterval)) == 4, "_ENetProtocolThrottleConfigure.packetThrottleInterval has unexpected size % instead of 4", size_of(type_of(_ENetProtocolThrottleConfigure.packetThrottleInterval)));
        assert(((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)) == 8, "_ENetProtocolThrottleConfigure.packetThrottleAcceleration has unexpected offset % instead of 8", ((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolThrottleConfigure.packetThrottleAcceleration)) == 4, "_ENetProtocolThrottleConfigure.packetThrottleAcceleration has unexpected size % instead of 4", size_of(type_of(_ENetProtocolThrottleConfigure.packetThrottleAcceleration)));
        assert(((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)) == 12, "_ENetProtocolThrottleConfigure.packetThrottleDeceleration has unexpected offset % instead of 12", ((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolThrottleConfigure.packetThrottleDeceleration)) == 4, "_ENetProtocolThrottleConfigure.packetThrottleDeceleration has unexpected size % instead of 4", size_of(type_of(_ENetProtocolThrottleConfigure.packetThrottleDeceleration)));
        assert(size_of(_ENetProtocolThrottleConfigure) == 16, "_ENetProtocolThrottleConfigure has size % instead of 16", size_of(_ENetProtocolThrottleConfigure));
    }

    {
        instance: _ENetProtocolDisconnect;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolDisconnect.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolDisconnect.header)) == 4, "_ENetProtocolDisconnect.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolDisconnect.header)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 4, "_ENetProtocolDisconnect.data has unexpected offset % instead of 4", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolDisconnect.data)) == 4, "_ENetProtocolDisconnect.data has unexpected size % instead of 4", size_of(type_of(_ENetProtocolDisconnect.data)));
        assert(size_of(_ENetProtocolDisconnect) == 8, "_ENetProtocolDisconnect has size % instead of 8", size_of(_ENetProtocolDisconnect));
    }

    {
        instance: _ENetProtocolPing;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolPing.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolPing.header)) == 4, "_ENetProtocolPing.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolPing.header)));
        assert(size_of(_ENetProtocolPing) == 4, "_ENetProtocolPing has size % instead of 4", size_of(_ENetProtocolPing));
    }

    {
        instance: _ENetProtocolSendReliable;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolSendReliable.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendReliable.header)) == 4, "_ENetProtocolSendReliable.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendReliable.header)));
        assert(((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)) == 4, "_ENetProtocolSendReliable.dataLength has unexpected offset % instead of 4", ((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendReliable.dataLength)) == 2, "_ENetProtocolSendReliable.dataLength has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendReliable.dataLength)));
        assert(size_of(_ENetProtocolSendReliable) == 6, "_ENetProtocolSendReliable has size % instead of 6", size_of(_ENetProtocolSendReliable));
    }

    {
        instance: _ENetProtocolSendUnreliable;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolSendUnreliable.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendUnreliable.header)) == 4, "_ENetProtocolSendUnreliable.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendUnreliable.header)));
        assert(((cast(*void)(*instance.unreliableSequenceNumber)) - cast(*void)(*instance)) == 4, "_ENetProtocolSendUnreliable.unreliableSequenceNumber has unexpected offset % instead of 4", ((cast(*void)(*instance.unreliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendUnreliable.unreliableSequenceNumber)) == 2, "_ENetProtocolSendUnreliable.unreliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendUnreliable.unreliableSequenceNumber)));
        assert(((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)) == 6, "_ENetProtocolSendUnreliable.dataLength has unexpected offset % instead of 6", ((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendUnreliable.dataLength)) == 2, "_ENetProtocolSendUnreliable.dataLength has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendUnreliable.dataLength)));
        assert(size_of(_ENetProtocolSendUnreliable) == 8, "_ENetProtocolSendUnreliable has size % instead of 8", size_of(_ENetProtocolSendUnreliable));
    }

    {
        instance: _ENetProtocolSendUnsequenced;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolSendUnsequenced.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendUnsequenced.header)) == 4, "_ENetProtocolSendUnsequenced.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendUnsequenced.header)));
        assert(((cast(*void)(*instance.unsequencedGroup)) - cast(*void)(*instance)) == 4, "_ENetProtocolSendUnsequenced.unsequencedGroup has unexpected offset % instead of 4", ((cast(*void)(*instance.unsequencedGroup)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendUnsequenced.unsequencedGroup)) == 2, "_ENetProtocolSendUnsequenced.unsequencedGroup has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendUnsequenced.unsequencedGroup)));
        assert(((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)) == 6, "_ENetProtocolSendUnsequenced.dataLength has unexpected offset % instead of 6", ((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendUnsequenced.dataLength)) == 2, "_ENetProtocolSendUnsequenced.dataLength has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendUnsequenced.dataLength)));
        assert(size_of(_ENetProtocolSendUnsequenced) == 8, "_ENetProtocolSendUnsequenced has size % instead of 8", size_of(_ENetProtocolSendUnsequenced));
    }

    {
        instance: _ENetProtocolSendFragment;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocolSendFragment.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.header)) == 4, "_ENetProtocolSendFragment.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendFragment.header)));
        assert(((cast(*void)(*instance.startSequenceNumber)) - cast(*void)(*instance)) == 4, "_ENetProtocolSendFragment.startSequenceNumber has unexpected offset % instead of 4", ((cast(*void)(*instance.startSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.startSequenceNumber)) == 2, "_ENetProtocolSendFragment.startSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendFragment.startSequenceNumber)));
        assert(((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)) == 6, "_ENetProtocolSendFragment.dataLength has unexpected offset % instead of 6", ((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.dataLength)) == 2, "_ENetProtocolSendFragment.dataLength has unexpected size % instead of 2", size_of(type_of(_ENetProtocolSendFragment.dataLength)));
        assert(((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)) == 8, "_ENetProtocolSendFragment.fragmentCount has unexpected offset % instead of 8", ((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.fragmentCount)) == 4, "_ENetProtocolSendFragment.fragmentCount has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendFragment.fragmentCount)));
        assert(((cast(*void)(*instance.fragmentNumber)) - cast(*void)(*instance)) == 12, "_ENetProtocolSendFragment.fragmentNumber has unexpected offset % instead of 12", ((cast(*void)(*instance.fragmentNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.fragmentNumber)) == 4, "_ENetProtocolSendFragment.fragmentNumber has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendFragment.fragmentNumber)));
        assert(((cast(*void)(*instance.totalLength)) - cast(*void)(*instance)) == 16, "_ENetProtocolSendFragment.totalLength has unexpected offset % instead of 16", ((cast(*void)(*instance.totalLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.totalLength)) == 4, "_ENetProtocolSendFragment.totalLength has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendFragment.totalLength)));
        assert(((cast(*void)(*instance.fragmentOffset)) - cast(*void)(*instance)) == 20, "_ENetProtocolSendFragment.fragmentOffset has unexpected offset % instead of 20", ((cast(*void)(*instance.fragmentOffset)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocolSendFragment.fragmentOffset)) == 4, "_ENetProtocolSendFragment.fragmentOffset has unexpected size % instead of 4", size_of(type_of(_ENetProtocolSendFragment.fragmentOffset)));
        assert(size_of(_ENetProtocolSendFragment) == 24, "_ENetProtocolSendFragment has size % instead of 24", size_of(_ENetProtocolSendFragment));
    }

    {
        instance: _ENetProtocol;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "_ENetProtocol.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.header)) == 4, "_ENetProtocol.header has unexpected size % instead of 4", size_of(type_of(_ENetProtocol.header)));
        assert(((cast(*void)(*instance.acknowledge)) - cast(*void)(*instance)) == 0, "_ENetProtocol.acknowledge has unexpected offset % instead of 0", ((cast(*void)(*instance.acknowledge)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.acknowledge)) == 8, "_ENetProtocol.acknowledge has unexpected size % instead of 8", size_of(type_of(_ENetProtocol.acknowledge)));
        assert(((cast(*void)(*instance.connect)) - cast(*void)(*instance)) == 0, "_ENetProtocol.connect has unexpected offset % instead of 0", ((cast(*void)(*instance.connect)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.connect)) == 48, "_ENetProtocol.connect has unexpected size % instead of 48", size_of(type_of(_ENetProtocol.connect)));
        assert(((cast(*void)(*instance.verifyConnect)) - cast(*void)(*instance)) == 0, "_ENetProtocol.verifyConnect has unexpected offset % instead of 0", ((cast(*void)(*instance.verifyConnect)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.verifyConnect)) == 44, "_ENetProtocol.verifyConnect has unexpected size % instead of 44", size_of(type_of(_ENetProtocol.verifyConnect)));
        assert(((cast(*void)(*instance.disconnect)) - cast(*void)(*instance)) == 0, "_ENetProtocol.disconnect has unexpected offset % instead of 0", ((cast(*void)(*instance.disconnect)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.disconnect)) == 8, "_ENetProtocol.disconnect has unexpected size % instead of 8", size_of(type_of(_ENetProtocol.disconnect)));
        assert(((cast(*void)(*instance.ping)) - cast(*void)(*instance)) == 0, "_ENetProtocol.ping has unexpected offset % instead of 0", ((cast(*void)(*instance.ping)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.ping)) == 4, "_ENetProtocol.ping has unexpected size % instead of 4", size_of(type_of(_ENetProtocol.ping)));
        assert(((cast(*void)(*instance.sendReliable)) - cast(*void)(*instance)) == 0, "_ENetProtocol.sendReliable has unexpected offset % instead of 0", ((cast(*void)(*instance.sendReliable)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.sendReliable)) == 6, "_ENetProtocol.sendReliable has unexpected size % instead of 6", size_of(type_of(_ENetProtocol.sendReliable)));
        assert(((cast(*void)(*instance.sendUnreliable)) - cast(*void)(*instance)) == 0, "_ENetProtocol.sendUnreliable has unexpected offset % instead of 0", ((cast(*void)(*instance.sendUnreliable)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.sendUnreliable)) == 8, "_ENetProtocol.sendUnreliable has unexpected size % instead of 8", size_of(type_of(_ENetProtocol.sendUnreliable)));
        assert(((cast(*void)(*instance.sendUnsequenced)) - cast(*void)(*instance)) == 0, "_ENetProtocol.sendUnsequenced has unexpected offset % instead of 0", ((cast(*void)(*instance.sendUnsequenced)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.sendUnsequenced)) == 8, "_ENetProtocol.sendUnsequenced has unexpected size % instead of 8", size_of(type_of(_ENetProtocol.sendUnsequenced)));
        assert(((cast(*void)(*instance.sendFragment)) - cast(*void)(*instance)) == 0, "_ENetProtocol.sendFragment has unexpected offset % instead of 0", ((cast(*void)(*instance.sendFragment)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.sendFragment)) == 24, "_ENetProtocol.sendFragment has unexpected size % instead of 24", size_of(type_of(_ENetProtocol.sendFragment)));
        assert(((cast(*void)(*instance.bandwidthLimit)) - cast(*void)(*instance)) == 0, "_ENetProtocol.bandwidthLimit has unexpected offset % instead of 0", ((cast(*void)(*instance.bandwidthLimit)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.bandwidthLimit)) == 12, "_ENetProtocol.bandwidthLimit has unexpected size % instead of 12", size_of(type_of(_ENetProtocol.bandwidthLimit)));
        assert(((cast(*void)(*instance.throttleConfigure)) - cast(*void)(*instance)) == 0, "_ENetProtocol.throttleConfigure has unexpected offset % instead of 0", ((cast(*void)(*instance.throttleConfigure)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetProtocol.throttleConfigure)) == 16, "_ENetProtocol.throttleConfigure has unexpected size % instead of 16", size_of(type_of(_ENetProtocol.throttleConfigure)));
        assert(size_of(_ENetProtocol) == 48, "_ENetProtocol has size % instead of 48", size_of(_ENetProtocol));
    }

    {
        instance: _ENetListNode;
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 0, "_ENetListNode.next has unexpected offset % instead of 0", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetListNode.next)) == 8, "_ENetListNode.next has unexpected size % instead of 8", size_of(type_of(_ENetListNode.next)));
        assert(((cast(*void)(*instance.previous)) - cast(*void)(*instance)) == 8, "_ENetListNode.previous has unexpected offset % instead of 8", ((cast(*void)(*instance.previous)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetListNode.previous)) == 8, "_ENetListNode.previous has unexpected size % instead of 8", size_of(type_of(_ENetListNode.previous)));
        assert(size_of(_ENetListNode) == 16, "_ENetListNode has size % instead of 16", size_of(_ENetListNode));
    }

    {
        instance: _ENetList;
        assert(((cast(*void)(*instance.sentinel)) - cast(*void)(*instance)) == 0, "_ENetList.sentinel has unexpected offset % instead of 0", ((cast(*void)(*instance.sentinel)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetList.sentinel)) == 16, "_ENetList.sentinel has unexpected size % instead of 16", size_of(type_of(_ENetList.sentinel)));
        assert(size_of(_ENetList) == 16, "_ENetList has size % instead of 16", size_of(_ENetList));
    }

    {
        instance: _ENetCallbacks;
        assert(((cast(*void)(*instance.malloc)) - cast(*void)(*instance)) == 0, "_ENetCallbacks.malloc has unexpected offset % instead of 0", ((cast(*void)(*instance.malloc)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCallbacks.malloc)) == 8, "_ENetCallbacks.malloc has unexpected size % instead of 8", size_of(type_of(_ENetCallbacks.malloc)));
        assert(((cast(*void)(*instance.free)) - cast(*void)(*instance)) == 8, "_ENetCallbacks.free has unexpected offset % instead of 8", ((cast(*void)(*instance.free)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCallbacks.free)) == 8, "_ENetCallbacks.free has unexpected size % instead of 8", size_of(type_of(_ENetCallbacks.free)));
        assert(((cast(*void)(*instance.no_memory)) - cast(*void)(*instance)) == 16, "_ENetCallbacks.no_memory has unexpected offset % instead of 16", ((cast(*void)(*instance.no_memory)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCallbacks.no_memory)) == 8, "_ENetCallbacks.no_memory has unexpected size % instead of 8", size_of(type_of(_ENetCallbacks.no_memory)));
        assert(size_of(_ENetCallbacks) == 24, "_ENetCallbacks has size % instead of 24", size_of(_ENetCallbacks));
    }

    {
        instance: _ENetAddress;
        assert(((cast(*void)(*instance.host)) - cast(*void)(*instance)) == 0, "_ENetAddress.host has unexpected offset % instead of 0", ((cast(*void)(*instance.host)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetAddress.host)) == 4, "_ENetAddress.host has unexpected size % instead of 4", size_of(type_of(_ENetAddress.host)));
        assert(((cast(*void)(*instance.port)) - cast(*void)(*instance)) == 4, "_ENetAddress.port has unexpected offset % instead of 4", ((cast(*void)(*instance.port)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetAddress.port)) == 2, "_ENetAddress.port has unexpected size % instead of 2", size_of(type_of(_ENetAddress.port)));
        assert(size_of(_ENetAddress) == 8, "_ENetAddress has size % instead of 8", size_of(_ENetAddress));
    }

    {
        instance: _ENetPacket;
        assert(((cast(*void)(*instance.referenceCount)) - cast(*void)(*instance)) == 0, "_ENetPacket.referenceCount has unexpected offset % instead of 0", ((cast(*void)(*instance.referenceCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPacket.referenceCount)) == 8, "_ENetPacket.referenceCount has unexpected size % instead of 8", size_of(type_of(_ENetPacket.referenceCount)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 8, "_ENetPacket.flags has unexpected offset % instead of 8", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPacket.flags)) == 4, "_ENetPacket.flags has unexpected size % instead of 4", size_of(type_of(_ENetPacket.flags)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 16, "_ENetPacket.data has unexpected offset % instead of 16", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPacket.data)) == 8, "_ENetPacket.data has unexpected size % instead of 8", size_of(type_of(_ENetPacket.data)));
        assert(((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)) == 24, "_ENetPacket.dataLength has unexpected offset % instead of 24", ((cast(*void)(*instance.dataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPacket.dataLength)) == 8, "_ENetPacket.dataLength has unexpected size % instead of 8", size_of(type_of(_ENetPacket.dataLength)));
        assert(((cast(*void)(*instance.freeCallback)) - cast(*void)(*instance)) == 32, "_ENetPacket.freeCallback has unexpected offset % instead of 32", ((cast(*void)(*instance.freeCallback)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPacket.freeCallback)) == 8, "_ENetPacket.freeCallback has unexpected size % instead of 8", size_of(type_of(_ENetPacket.freeCallback)));
        assert(((cast(*void)(*instance.userData)) - cast(*void)(*instance)) == 40, "_ENetPacket.userData has unexpected offset % instead of 40", ((cast(*void)(*instance.userData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPacket.userData)) == 8, "_ENetPacket.userData has unexpected size % instead of 8", size_of(type_of(_ENetPacket.userData)));
        assert(size_of(_ENetPacket) == 48, "_ENetPacket has size % instead of 48", size_of(_ENetPacket));
    }

    {
        instance: _ENetAcknowledgement;
        assert(((cast(*void)(*instance.acknowledgementList)) - cast(*void)(*instance)) == 0, "_ENetAcknowledgement.acknowledgementList has unexpected offset % instead of 0", ((cast(*void)(*instance.acknowledgementList)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetAcknowledgement.acknowledgementList)) == 16, "_ENetAcknowledgement.acknowledgementList has unexpected size % instead of 16", size_of(type_of(_ENetAcknowledgement.acknowledgementList)));
        assert(((cast(*void)(*instance.sentTime)) - cast(*void)(*instance)) == 16, "_ENetAcknowledgement.sentTime has unexpected offset % instead of 16", ((cast(*void)(*instance.sentTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetAcknowledgement.sentTime)) == 4, "_ENetAcknowledgement.sentTime has unexpected size % instead of 4", size_of(type_of(_ENetAcknowledgement.sentTime)));
        assert(((cast(*void)(*instance.command)) - cast(*void)(*instance)) == 20, "_ENetAcknowledgement.command has unexpected offset % instead of 20", ((cast(*void)(*instance.command)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetAcknowledgement.command)) == 48, "_ENetAcknowledgement.command has unexpected size % instead of 48", size_of(type_of(_ENetAcknowledgement.command)));
        assert(size_of(_ENetAcknowledgement) == 72, "_ENetAcknowledgement has size % instead of 72", size_of(_ENetAcknowledgement));
    }

    {
        instance: _ENetOutgoingCommand;
        assert(((cast(*void)(*instance.outgoingCommandList)) - cast(*void)(*instance)) == 0, "_ENetOutgoingCommand.outgoingCommandList has unexpected offset % instead of 0", ((cast(*void)(*instance.outgoingCommandList)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.outgoingCommandList)) == 16, "_ENetOutgoingCommand.outgoingCommandList has unexpected size % instead of 16", size_of(type_of(_ENetOutgoingCommand.outgoingCommandList)));
        assert(((cast(*void)(*instance.reliableSequenceNumber)) - cast(*void)(*instance)) == 16, "_ENetOutgoingCommand.reliableSequenceNumber has unexpected offset % instead of 16", ((cast(*void)(*instance.reliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.reliableSequenceNumber)) == 2, "_ENetOutgoingCommand.reliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetOutgoingCommand.reliableSequenceNumber)));
        assert(((cast(*void)(*instance.unreliableSequenceNumber)) - cast(*void)(*instance)) == 18, "_ENetOutgoingCommand.unreliableSequenceNumber has unexpected offset % instead of 18", ((cast(*void)(*instance.unreliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.unreliableSequenceNumber)) == 2, "_ENetOutgoingCommand.unreliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetOutgoingCommand.unreliableSequenceNumber)));
        assert(((cast(*void)(*instance.sentTime)) - cast(*void)(*instance)) == 20, "_ENetOutgoingCommand.sentTime has unexpected offset % instead of 20", ((cast(*void)(*instance.sentTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.sentTime)) == 4, "_ENetOutgoingCommand.sentTime has unexpected size % instead of 4", size_of(type_of(_ENetOutgoingCommand.sentTime)));
        assert(((cast(*void)(*instance.roundTripTimeout)) - cast(*void)(*instance)) == 24, "_ENetOutgoingCommand.roundTripTimeout has unexpected offset % instead of 24", ((cast(*void)(*instance.roundTripTimeout)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.roundTripTimeout)) == 4, "_ENetOutgoingCommand.roundTripTimeout has unexpected size % instead of 4", size_of(type_of(_ENetOutgoingCommand.roundTripTimeout)));
        assert(((cast(*void)(*instance.queueTime)) - cast(*void)(*instance)) == 28, "_ENetOutgoingCommand.queueTime has unexpected offset % instead of 28", ((cast(*void)(*instance.queueTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.queueTime)) == 4, "_ENetOutgoingCommand.queueTime has unexpected size % instead of 4", size_of(type_of(_ENetOutgoingCommand.queueTime)));
        assert(((cast(*void)(*instance.fragmentOffset)) - cast(*void)(*instance)) == 32, "_ENetOutgoingCommand.fragmentOffset has unexpected offset % instead of 32", ((cast(*void)(*instance.fragmentOffset)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.fragmentOffset)) == 4, "_ENetOutgoingCommand.fragmentOffset has unexpected size % instead of 4", size_of(type_of(_ENetOutgoingCommand.fragmentOffset)));
        assert(((cast(*void)(*instance.fragmentLength)) - cast(*void)(*instance)) == 36, "_ENetOutgoingCommand.fragmentLength has unexpected offset % instead of 36", ((cast(*void)(*instance.fragmentLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.fragmentLength)) == 2, "_ENetOutgoingCommand.fragmentLength has unexpected size % instead of 2", size_of(type_of(_ENetOutgoingCommand.fragmentLength)));
        assert(((cast(*void)(*instance.sendAttempts)) - cast(*void)(*instance)) == 38, "_ENetOutgoingCommand.sendAttempts has unexpected offset % instead of 38", ((cast(*void)(*instance.sendAttempts)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.sendAttempts)) == 2, "_ENetOutgoingCommand.sendAttempts has unexpected size % instead of 2", size_of(type_of(_ENetOutgoingCommand.sendAttempts)));
        assert(((cast(*void)(*instance.command)) - cast(*void)(*instance)) == 40, "_ENetOutgoingCommand.command has unexpected offset % instead of 40", ((cast(*void)(*instance.command)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.command)) == 48, "_ENetOutgoingCommand.command has unexpected size % instead of 48", size_of(type_of(_ENetOutgoingCommand.command)));
        assert(((cast(*void)(*instance.packet)) - cast(*void)(*instance)) == 88, "_ENetOutgoingCommand.packet has unexpected offset % instead of 88", ((cast(*void)(*instance.packet)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetOutgoingCommand.packet)) == 8, "_ENetOutgoingCommand.packet has unexpected size % instead of 8", size_of(type_of(_ENetOutgoingCommand.packet)));
        assert(size_of(_ENetOutgoingCommand) == 96, "_ENetOutgoingCommand has size % instead of 96", size_of(_ENetOutgoingCommand));
    }

    {
        instance: _ENetIncomingCommand;
        assert(((cast(*void)(*instance.incomingCommandList)) - cast(*void)(*instance)) == 0, "_ENetIncomingCommand.incomingCommandList has unexpected offset % instead of 0", ((cast(*void)(*instance.incomingCommandList)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.incomingCommandList)) == 16, "_ENetIncomingCommand.incomingCommandList has unexpected size % instead of 16", size_of(type_of(_ENetIncomingCommand.incomingCommandList)));
        assert(((cast(*void)(*instance.reliableSequenceNumber)) - cast(*void)(*instance)) == 16, "_ENetIncomingCommand.reliableSequenceNumber has unexpected offset % instead of 16", ((cast(*void)(*instance.reliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.reliableSequenceNumber)) == 2, "_ENetIncomingCommand.reliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetIncomingCommand.reliableSequenceNumber)));
        assert(((cast(*void)(*instance.unreliableSequenceNumber)) - cast(*void)(*instance)) == 18, "_ENetIncomingCommand.unreliableSequenceNumber has unexpected offset % instead of 18", ((cast(*void)(*instance.unreliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.unreliableSequenceNumber)) == 2, "_ENetIncomingCommand.unreliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetIncomingCommand.unreliableSequenceNumber)));
        assert(((cast(*void)(*instance.command)) - cast(*void)(*instance)) == 20, "_ENetIncomingCommand.command has unexpected offset % instead of 20", ((cast(*void)(*instance.command)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.command)) == 48, "_ENetIncomingCommand.command has unexpected size % instead of 48", size_of(type_of(_ENetIncomingCommand.command)));
        assert(((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)) == 68, "_ENetIncomingCommand.fragmentCount has unexpected offset % instead of 68", ((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.fragmentCount)) == 4, "_ENetIncomingCommand.fragmentCount has unexpected size % instead of 4", size_of(type_of(_ENetIncomingCommand.fragmentCount)));
        assert(((cast(*void)(*instance.fragmentsRemaining)) - cast(*void)(*instance)) == 72, "_ENetIncomingCommand.fragmentsRemaining has unexpected offset % instead of 72", ((cast(*void)(*instance.fragmentsRemaining)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.fragmentsRemaining)) == 4, "_ENetIncomingCommand.fragmentsRemaining has unexpected size % instead of 4", size_of(type_of(_ENetIncomingCommand.fragmentsRemaining)));
        assert(((cast(*void)(*instance.fragments)) - cast(*void)(*instance)) == 80, "_ENetIncomingCommand.fragments has unexpected offset % instead of 80", ((cast(*void)(*instance.fragments)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.fragments)) == 8, "_ENetIncomingCommand.fragments has unexpected size % instead of 8", size_of(type_of(_ENetIncomingCommand.fragments)));
        assert(((cast(*void)(*instance.packet)) - cast(*void)(*instance)) == 88, "_ENetIncomingCommand.packet has unexpected offset % instead of 88", ((cast(*void)(*instance.packet)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetIncomingCommand.packet)) == 8, "_ENetIncomingCommand.packet has unexpected size % instead of 8", size_of(type_of(_ENetIncomingCommand.packet)));
        assert(size_of(_ENetIncomingCommand) == 96, "_ENetIncomingCommand has size % instead of 96", size_of(_ENetIncomingCommand));
    }

    {
        instance: _ENetChannel;
        assert(((cast(*void)(*instance.outgoingReliableSequenceNumber)) - cast(*void)(*instance)) == 0, "_ENetChannel.outgoingReliableSequenceNumber has unexpected offset % instead of 0", ((cast(*void)(*instance.outgoingReliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.outgoingReliableSequenceNumber)) == 2, "_ENetChannel.outgoingReliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetChannel.outgoingReliableSequenceNumber)));
        assert(((cast(*void)(*instance.outgoingUnreliableSequenceNumber)) - cast(*void)(*instance)) == 2, "_ENetChannel.outgoingUnreliableSequenceNumber has unexpected offset % instead of 2", ((cast(*void)(*instance.outgoingUnreliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.outgoingUnreliableSequenceNumber)) == 2, "_ENetChannel.outgoingUnreliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetChannel.outgoingUnreliableSequenceNumber)));
        assert(((cast(*void)(*instance.usedReliableWindows)) - cast(*void)(*instance)) == 4, "_ENetChannel.usedReliableWindows has unexpected offset % instead of 4", ((cast(*void)(*instance.usedReliableWindows)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.usedReliableWindows)) == 2, "_ENetChannel.usedReliableWindows has unexpected size % instead of 2", size_of(type_of(_ENetChannel.usedReliableWindows)));
        assert(((cast(*void)(*instance.reliableWindows)) - cast(*void)(*instance)) == 6, "_ENetChannel.reliableWindows has unexpected offset % instead of 6", ((cast(*void)(*instance.reliableWindows)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.reliableWindows)) == 32, "_ENetChannel.reliableWindows has unexpected size % instead of 32", size_of(type_of(_ENetChannel.reliableWindows)));
        assert(((cast(*void)(*instance.incomingReliableSequenceNumber)) - cast(*void)(*instance)) == 38, "_ENetChannel.incomingReliableSequenceNumber has unexpected offset % instead of 38", ((cast(*void)(*instance.incomingReliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.incomingReliableSequenceNumber)) == 2, "_ENetChannel.incomingReliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetChannel.incomingReliableSequenceNumber)));
        assert(((cast(*void)(*instance.incomingUnreliableSequenceNumber)) - cast(*void)(*instance)) == 40, "_ENetChannel.incomingUnreliableSequenceNumber has unexpected offset % instead of 40", ((cast(*void)(*instance.incomingUnreliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.incomingUnreliableSequenceNumber)) == 2, "_ENetChannel.incomingUnreliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetChannel.incomingUnreliableSequenceNumber)));
        assert(((cast(*void)(*instance.incomingReliableCommands)) - cast(*void)(*instance)) == 48, "_ENetChannel.incomingReliableCommands has unexpected offset % instead of 48", ((cast(*void)(*instance.incomingReliableCommands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.incomingReliableCommands)) == 16, "_ENetChannel.incomingReliableCommands has unexpected size % instead of 16", size_of(type_of(_ENetChannel.incomingReliableCommands)));
        assert(((cast(*void)(*instance.incomingUnreliableCommands)) - cast(*void)(*instance)) == 64, "_ENetChannel.incomingUnreliableCommands has unexpected offset % instead of 64", ((cast(*void)(*instance.incomingUnreliableCommands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetChannel.incomingUnreliableCommands)) == 16, "_ENetChannel.incomingUnreliableCommands has unexpected size % instead of 16", size_of(type_of(_ENetChannel.incomingUnreliableCommands)));
        assert(size_of(_ENetChannel) == 80, "_ENetChannel has size % instead of 80", size_of(_ENetChannel));
    }

    {
        instance: _ENetPeer;
        assert(((cast(*void)(*instance.dispatchList)) - cast(*void)(*instance)) == 0, "_ENetPeer.dispatchList has unexpected offset % instead of 0", ((cast(*void)(*instance.dispatchList)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.dispatchList)) == 16, "_ENetPeer.dispatchList has unexpected size % instead of 16", size_of(type_of(_ENetPeer.dispatchList)));
        assert(((cast(*void)(*instance.host)) - cast(*void)(*instance)) == 16, "_ENetPeer.host has unexpected offset % instead of 16", ((cast(*void)(*instance.host)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.host)) == 8, "_ENetPeer.host has unexpected size % instead of 8", size_of(type_of(_ENetPeer.host)));
        assert(((cast(*void)(*instance.outgoingPeerID)) - cast(*void)(*instance)) == 24, "_ENetPeer.outgoingPeerID has unexpected offset % instead of 24", ((cast(*void)(*instance.outgoingPeerID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingPeerID)) == 2, "_ENetPeer.outgoingPeerID has unexpected size % instead of 2", size_of(type_of(_ENetPeer.outgoingPeerID)));
        assert(((cast(*void)(*instance.incomingPeerID)) - cast(*void)(*instance)) == 26, "_ENetPeer.incomingPeerID has unexpected offset % instead of 26", ((cast(*void)(*instance.incomingPeerID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.incomingPeerID)) == 2, "_ENetPeer.incomingPeerID has unexpected size % instead of 2", size_of(type_of(_ENetPeer.incomingPeerID)));
        assert(((cast(*void)(*instance.connectID)) - cast(*void)(*instance)) == 28, "_ENetPeer.connectID has unexpected offset % instead of 28", ((cast(*void)(*instance.connectID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.connectID)) == 4, "_ENetPeer.connectID has unexpected size % instead of 4", size_of(type_of(_ENetPeer.connectID)));
        assert(((cast(*void)(*instance.outgoingSessionID)) - cast(*void)(*instance)) == 32, "_ENetPeer.outgoingSessionID has unexpected offset % instead of 32", ((cast(*void)(*instance.outgoingSessionID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingSessionID)) == 1, "_ENetPeer.outgoingSessionID has unexpected size % instead of 1", size_of(type_of(_ENetPeer.outgoingSessionID)));
        assert(((cast(*void)(*instance.incomingSessionID)) - cast(*void)(*instance)) == 33, "_ENetPeer.incomingSessionID has unexpected offset % instead of 33", ((cast(*void)(*instance.incomingSessionID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.incomingSessionID)) == 1, "_ENetPeer.incomingSessionID has unexpected size % instead of 1", size_of(type_of(_ENetPeer.incomingSessionID)));
        assert(((cast(*void)(*instance.address)) - cast(*void)(*instance)) == 36, "_ENetPeer.address has unexpected offset % instead of 36", ((cast(*void)(*instance.address)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.address)) == 8, "_ENetPeer.address has unexpected size % instead of 8", size_of(type_of(_ENetPeer.address)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 48, "_ENetPeer.data has unexpected offset % instead of 48", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.data)) == 8, "_ENetPeer.data has unexpected size % instead of 8", size_of(type_of(_ENetPeer.data)));
        assert(((cast(*void)(*instance.state)) - cast(*void)(*instance)) == 56, "_ENetPeer.state has unexpected offset % instead of 56", ((cast(*void)(*instance.state)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.state)) == 4, "_ENetPeer.state has unexpected size % instead of 4", size_of(type_of(_ENetPeer.state)));
        assert(((cast(*void)(*instance.channels)) - cast(*void)(*instance)) == 64, "_ENetPeer.channels has unexpected offset % instead of 64", ((cast(*void)(*instance.channels)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.channels)) == 8, "_ENetPeer.channels has unexpected size % instead of 8", size_of(type_of(_ENetPeer.channels)));
        assert(((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)) == 72, "_ENetPeer.channelCount has unexpected offset % instead of 72", ((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.channelCount)) == 8, "_ENetPeer.channelCount has unexpected size % instead of 8", size_of(type_of(_ENetPeer.channelCount)));
        assert(((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)) == 80, "_ENetPeer.incomingBandwidth has unexpected offset % instead of 80", ((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.incomingBandwidth)) == 4, "_ENetPeer.incomingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetPeer.incomingBandwidth)));
        assert(((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)) == 84, "_ENetPeer.outgoingBandwidth has unexpected offset % instead of 84", ((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingBandwidth)) == 4, "_ENetPeer.outgoingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetPeer.outgoingBandwidth)));
        assert(((cast(*void)(*instance.incomingBandwidthThrottleEpoch)) - cast(*void)(*instance)) == 88, "_ENetPeer.incomingBandwidthThrottleEpoch has unexpected offset % instead of 88", ((cast(*void)(*instance.incomingBandwidthThrottleEpoch)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.incomingBandwidthThrottleEpoch)) == 4, "_ENetPeer.incomingBandwidthThrottleEpoch has unexpected size % instead of 4", size_of(type_of(_ENetPeer.incomingBandwidthThrottleEpoch)));
        assert(((cast(*void)(*instance.outgoingBandwidthThrottleEpoch)) - cast(*void)(*instance)) == 92, "_ENetPeer.outgoingBandwidthThrottleEpoch has unexpected offset % instead of 92", ((cast(*void)(*instance.outgoingBandwidthThrottleEpoch)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingBandwidthThrottleEpoch)) == 4, "_ENetPeer.outgoingBandwidthThrottleEpoch has unexpected size % instead of 4", size_of(type_of(_ENetPeer.outgoingBandwidthThrottleEpoch)));
        assert(((cast(*void)(*instance.incomingDataTotal)) - cast(*void)(*instance)) == 96, "_ENetPeer.incomingDataTotal has unexpected offset % instead of 96", ((cast(*void)(*instance.incomingDataTotal)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.incomingDataTotal)) == 4, "_ENetPeer.incomingDataTotal has unexpected size % instead of 4", size_of(type_of(_ENetPeer.incomingDataTotal)));
        assert(((cast(*void)(*instance.outgoingDataTotal)) - cast(*void)(*instance)) == 100, "_ENetPeer.outgoingDataTotal has unexpected offset % instead of 100", ((cast(*void)(*instance.outgoingDataTotal)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingDataTotal)) == 4, "_ENetPeer.outgoingDataTotal has unexpected size % instead of 4", size_of(type_of(_ENetPeer.outgoingDataTotal)));
        assert(((cast(*void)(*instance.lastSendTime)) - cast(*void)(*instance)) == 104, "_ENetPeer.lastSendTime has unexpected offset % instead of 104", ((cast(*void)(*instance.lastSendTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.lastSendTime)) == 4, "_ENetPeer.lastSendTime has unexpected size % instead of 4", size_of(type_of(_ENetPeer.lastSendTime)));
        assert(((cast(*void)(*instance.lastReceiveTime)) - cast(*void)(*instance)) == 108, "_ENetPeer.lastReceiveTime has unexpected offset % instead of 108", ((cast(*void)(*instance.lastReceiveTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.lastReceiveTime)) == 4, "_ENetPeer.lastReceiveTime has unexpected size % instead of 4", size_of(type_of(_ENetPeer.lastReceiveTime)));
        assert(((cast(*void)(*instance.nextTimeout)) - cast(*void)(*instance)) == 112, "_ENetPeer.nextTimeout has unexpected offset % instead of 112", ((cast(*void)(*instance.nextTimeout)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.nextTimeout)) == 4, "_ENetPeer.nextTimeout has unexpected size % instead of 4", size_of(type_of(_ENetPeer.nextTimeout)));
        assert(((cast(*void)(*instance.earliestTimeout)) - cast(*void)(*instance)) == 116, "_ENetPeer.earliestTimeout has unexpected offset % instead of 116", ((cast(*void)(*instance.earliestTimeout)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.earliestTimeout)) == 4, "_ENetPeer.earliestTimeout has unexpected size % instead of 4", size_of(type_of(_ENetPeer.earliestTimeout)));
        assert(((cast(*void)(*instance.packetLossEpoch)) - cast(*void)(*instance)) == 120, "_ENetPeer.packetLossEpoch has unexpected offset % instead of 120", ((cast(*void)(*instance.packetLossEpoch)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetLossEpoch)) == 4, "_ENetPeer.packetLossEpoch has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetLossEpoch)));
        assert(((cast(*void)(*instance.packetsSent)) - cast(*void)(*instance)) == 124, "_ENetPeer.packetsSent has unexpected offset % instead of 124", ((cast(*void)(*instance.packetsSent)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetsSent)) == 4, "_ENetPeer.packetsSent has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetsSent)));
        assert(((cast(*void)(*instance.packetsLost)) - cast(*void)(*instance)) == 128, "_ENetPeer.packetsLost has unexpected offset % instead of 128", ((cast(*void)(*instance.packetsLost)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetsLost)) == 4, "_ENetPeer.packetsLost has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetsLost)));
        assert(((cast(*void)(*instance.packetLoss)) - cast(*void)(*instance)) == 132, "_ENetPeer.packetLoss has unexpected offset % instead of 132", ((cast(*void)(*instance.packetLoss)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetLoss)) == 4, "_ENetPeer.packetLoss has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetLoss)));
        assert(((cast(*void)(*instance.packetLossVariance)) - cast(*void)(*instance)) == 136, "_ENetPeer.packetLossVariance has unexpected offset % instead of 136", ((cast(*void)(*instance.packetLossVariance)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetLossVariance)) == 4, "_ENetPeer.packetLossVariance has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetLossVariance)));
        assert(((cast(*void)(*instance.packetThrottle)) - cast(*void)(*instance)) == 140, "_ENetPeer.packetThrottle has unexpected offset % instead of 140", ((cast(*void)(*instance.packetThrottle)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottle)) == 4, "_ENetPeer.packetThrottle has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottle)));
        assert(((cast(*void)(*instance.packetThrottleLimit)) - cast(*void)(*instance)) == 144, "_ENetPeer.packetThrottleLimit has unexpected offset % instead of 144", ((cast(*void)(*instance.packetThrottleLimit)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottleLimit)) == 4, "_ENetPeer.packetThrottleLimit has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottleLimit)));
        assert(((cast(*void)(*instance.packetThrottleCounter)) - cast(*void)(*instance)) == 148, "_ENetPeer.packetThrottleCounter has unexpected offset % instead of 148", ((cast(*void)(*instance.packetThrottleCounter)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottleCounter)) == 4, "_ENetPeer.packetThrottleCounter has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottleCounter)));
        assert(((cast(*void)(*instance.packetThrottleEpoch)) - cast(*void)(*instance)) == 152, "_ENetPeer.packetThrottleEpoch has unexpected offset % instead of 152", ((cast(*void)(*instance.packetThrottleEpoch)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottleEpoch)) == 4, "_ENetPeer.packetThrottleEpoch has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottleEpoch)));
        assert(((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)) == 156, "_ENetPeer.packetThrottleAcceleration has unexpected offset % instead of 156", ((cast(*void)(*instance.packetThrottleAcceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottleAcceleration)) == 4, "_ENetPeer.packetThrottleAcceleration has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottleAcceleration)));
        assert(((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)) == 160, "_ENetPeer.packetThrottleDeceleration has unexpected offset % instead of 160", ((cast(*void)(*instance.packetThrottleDeceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottleDeceleration)) == 4, "_ENetPeer.packetThrottleDeceleration has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottleDeceleration)));
        assert(((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)) == 164, "_ENetPeer.packetThrottleInterval has unexpected offset % instead of 164", ((cast(*void)(*instance.packetThrottleInterval)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.packetThrottleInterval)) == 4, "_ENetPeer.packetThrottleInterval has unexpected size % instead of 4", size_of(type_of(_ENetPeer.packetThrottleInterval)));
        assert(((cast(*void)(*instance.pingInterval)) - cast(*void)(*instance)) == 168, "_ENetPeer.pingInterval has unexpected offset % instead of 168", ((cast(*void)(*instance.pingInterval)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.pingInterval)) == 4, "_ENetPeer.pingInterval has unexpected size % instead of 4", size_of(type_of(_ENetPeer.pingInterval)));
        assert(((cast(*void)(*instance.timeoutLimit)) - cast(*void)(*instance)) == 172, "_ENetPeer.timeoutLimit has unexpected offset % instead of 172", ((cast(*void)(*instance.timeoutLimit)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.timeoutLimit)) == 4, "_ENetPeer.timeoutLimit has unexpected size % instead of 4", size_of(type_of(_ENetPeer.timeoutLimit)));
        assert(((cast(*void)(*instance.timeoutMinimum)) - cast(*void)(*instance)) == 176, "_ENetPeer.timeoutMinimum has unexpected offset % instead of 176", ((cast(*void)(*instance.timeoutMinimum)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.timeoutMinimum)) == 4, "_ENetPeer.timeoutMinimum has unexpected size % instead of 4", size_of(type_of(_ENetPeer.timeoutMinimum)));
        assert(((cast(*void)(*instance.timeoutMaximum)) - cast(*void)(*instance)) == 180, "_ENetPeer.timeoutMaximum has unexpected offset % instead of 180", ((cast(*void)(*instance.timeoutMaximum)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.timeoutMaximum)) == 4, "_ENetPeer.timeoutMaximum has unexpected size % instead of 4", size_of(type_of(_ENetPeer.timeoutMaximum)));
        assert(((cast(*void)(*instance.lastRoundTripTime)) - cast(*void)(*instance)) == 184, "_ENetPeer.lastRoundTripTime has unexpected offset % instead of 184", ((cast(*void)(*instance.lastRoundTripTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.lastRoundTripTime)) == 4, "_ENetPeer.lastRoundTripTime has unexpected size % instead of 4", size_of(type_of(_ENetPeer.lastRoundTripTime)));
        assert(((cast(*void)(*instance.lowestRoundTripTime)) - cast(*void)(*instance)) == 188, "_ENetPeer.lowestRoundTripTime has unexpected offset % instead of 188", ((cast(*void)(*instance.lowestRoundTripTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.lowestRoundTripTime)) == 4, "_ENetPeer.lowestRoundTripTime has unexpected size % instead of 4", size_of(type_of(_ENetPeer.lowestRoundTripTime)));
        assert(((cast(*void)(*instance.lastRoundTripTimeVariance)) - cast(*void)(*instance)) == 192, "_ENetPeer.lastRoundTripTimeVariance has unexpected offset % instead of 192", ((cast(*void)(*instance.lastRoundTripTimeVariance)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.lastRoundTripTimeVariance)) == 4, "_ENetPeer.lastRoundTripTimeVariance has unexpected size % instead of 4", size_of(type_of(_ENetPeer.lastRoundTripTimeVariance)));
        assert(((cast(*void)(*instance.highestRoundTripTimeVariance)) - cast(*void)(*instance)) == 196, "_ENetPeer.highestRoundTripTimeVariance has unexpected offset % instead of 196", ((cast(*void)(*instance.highestRoundTripTimeVariance)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.highestRoundTripTimeVariance)) == 4, "_ENetPeer.highestRoundTripTimeVariance has unexpected size % instead of 4", size_of(type_of(_ENetPeer.highestRoundTripTimeVariance)));
        assert(((cast(*void)(*instance.roundTripTime)) - cast(*void)(*instance)) == 200, "_ENetPeer.roundTripTime has unexpected offset % instead of 200", ((cast(*void)(*instance.roundTripTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.roundTripTime)) == 4, "_ENetPeer.roundTripTime has unexpected size % instead of 4", size_of(type_of(_ENetPeer.roundTripTime)));
        assert(((cast(*void)(*instance.roundTripTimeVariance)) - cast(*void)(*instance)) == 204, "_ENetPeer.roundTripTimeVariance has unexpected offset % instead of 204", ((cast(*void)(*instance.roundTripTimeVariance)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.roundTripTimeVariance)) == 4, "_ENetPeer.roundTripTimeVariance has unexpected size % instead of 4", size_of(type_of(_ENetPeer.roundTripTimeVariance)));
        assert(((cast(*void)(*instance.mtu)) - cast(*void)(*instance)) == 208, "_ENetPeer.mtu has unexpected offset % instead of 208", ((cast(*void)(*instance.mtu)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.mtu)) == 4, "_ENetPeer.mtu has unexpected size % instead of 4", size_of(type_of(_ENetPeer.mtu)));
        assert(((cast(*void)(*instance.windowSize)) - cast(*void)(*instance)) == 212, "_ENetPeer.windowSize has unexpected offset % instead of 212", ((cast(*void)(*instance.windowSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.windowSize)) == 4, "_ENetPeer.windowSize has unexpected size % instead of 4", size_of(type_of(_ENetPeer.windowSize)));
        assert(((cast(*void)(*instance.reliableDataInTransit)) - cast(*void)(*instance)) == 216, "_ENetPeer.reliableDataInTransit has unexpected offset % instead of 216", ((cast(*void)(*instance.reliableDataInTransit)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.reliableDataInTransit)) == 4, "_ENetPeer.reliableDataInTransit has unexpected size % instead of 4", size_of(type_of(_ENetPeer.reliableDataInTransit)));
        assert(((cast(*void)(*instance.outgoingReliableSequenceNumber)) - cast(*void)(*instance)) == 220, "_ENetPeer.outgoingReliableSequenceNumber has unexpected offset % instead of 220", ((cast(*void)(*instance.outgoingReliableSequenceNumber)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingReliableSequenceNumber)) == 2, "_ENetPeer.outgoingReliableSequenceNumber has unexpected size % instead of 2", size_of(type_of(_ENetPeer.outgoingReliableSequenceNumber)));
        assert(((cast(*void)(*instance.acknowledgements)) - cast(*void)(*instance)) == 224, "_ENetPeer.acknowledgements has unexpected offset % instead of 224", ((cast(*void)(*instance.acknowledgements)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.acknowledgements)) == 16, "_ENetPeer.acknowledgements has unexpected size % instead of 16", size_of(type_of(_ENetPeer.acknowledgements)));
        assert(((cast(*void)(*instance.sentReliableCommands)) - cast(*void)(*instance)) == 240, "_ENetPeer.sentReliableCommands has unexpected offset % instead of 240", ((cast(*void)(*instance.sentReliableCommands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.sentReliableCommands)) == 16, "_ENetPeer.sentReliableCommands has unexpected size % instead of 16", size_of(type_of(_ENetPeer.sentReliableCommands)));
        assert(((cast(*void)(*instance.outgoingSendReliableCommands)) - cast(*void)(*instance)) == 256, "_ENetPeer.outgoingSendReliableCommands has unexpected offset % instead of 256", ((cast(*void)(*instance.outgoingSendReliableCommands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingSendReliableCommands)) == 16, "_ENetPeer.outgoingSendReliableCommands has unexpected size % instead of 16", size_of(type_of(_ENetPeer.outgoingSendReliableCommands)));
        assert(((cast(*void)(*instance.outgoingCommands)) - cast(*void)(*instance)) == 272, "_ENetPeer.outgoingCommands has unexpected offset % instead of 272", ((cast(*void)(*instance.outgoingCommands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingCommands)) == 16, "_ENetPeer.outgoingCommands has unexpected size % instead of 16", size_of(type_of(_ENetPeer.outgoingCommands)));
        assert(((cast(*void)(*instance.dispatchedCommands)) - cast(*void)(*instance)) == 288, "_ENetPeer.dispatchedCommands has unexpected offset % instead of 288", ((cast(*void)(*instance.dispatchedCommands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.dispatchedCommands)) == 16, "_ENetPeer.dispatchedCommands has unexpected size % instead of 16", size_of(type_of(_ENetPeer.dispatchedCommands)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 304, "_ENetPeer.flags has unexpected offset % instead of 304", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.flags)) == 2, "_ENetPeer.flags has unexpected size % instead of 2", size_of(type_of(_ENetPeer.flags)));
        assert(((cast(*void)(*instance.reserved)) - cast(*void)(*instance)) == 306, "_ENetPeer.reserved has unexpected offset % instead of 306", ((cast(*void)(*instance.reserved)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.reserved)) == 2, "_ENetPeer.reserved has unexpected size % instead of 2", size_of(type_of(_ENetPeer.reserved)));
        assert(((cast(*void)(*instance.incomingUnsequencedGroup)) - cast(*void)(*instance)) == 308, "_ENetPeer.incomingUnsequencedGroup has unexpected offset % instead of 308", ((cast(*void)(*instance.incomingUnsequencedGroup)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.incomingUnsequencedGroup)) == 2, "_ENetPeer.incomingUnsequencedGroup has unexpected size % instead of 2", size_of(type_of(_ENetPeer.incomingUnsequencedGroup)));
        assert(((cast(*void)(*instance.outgoingUnsequencedGroup)) - cast(*void)(*instance)) == 310, "_ENetPeer.outgoingUnsequencedGroup has unexpected offset % instead of 310", ((cast(*void)(*instance.outgoingUnsequencedGroup)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.outgoingUnsequencedGroup)) == 2, "_ENetPeer.outgoingUnsequencedGroup has unexpected size % instead of 2", size_of(type_of(_ENetPeer.outgoingUnsequencedGroup)));
        assert(((cast(*void)(*instance.unsequencedWindow)) - cast(*void)(*instance)) == 312, "_ENetPeer.unsequencedWindow has unexpected offset % instead of 312", ((cast(*void)(*instance.unsequencedWindow)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.unsequencedWindow)) == 128, "_ENetPeer.unsequencedWindow has unexpected size % instead of 128", size_of(type_of(_ENetPeer.unsequencedWindow)));
        assert(((cast(*void)(*instance.eventData)) - cast(*void)(*instance)) == 440, "_ENetPeer.eventData has unexpected offset % instead of 440", ((cast(*void)(*instance.eventData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.eventData)) == 4, "_ENetPeer.eventData has unexpected size % instead of 4", size_of(type_of(_ENetPeer.eventData)));
        assert(((cast(*void)(*instance.totalWaitingData)) - cast(*void)(*instance)) == 448, "_ENetPeer.totalWaitingData has unexpected offset % instead of 448", ((cast(*void)(*instance.totalWaitingData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetPeer.totalWaitingData)) == 8, "_ENetPeer.totalWaitingData has unexpected size % instead of 8", size_of(type_of(_ENetPeer.totalWaitingData)));
        assert(size_of(_ENetPeer) == 456, "_ENetPeer has size % instead of 456", size_of(_ENetPeer));
    }

    {
        instance: _ENetCompressor;
        assert(((cast(*void)(*instance._context)) - cast(*void)(*instance)) == 0, "_ENetCompressor._context has unexpected offset % instead of 0", ((cast(*void)(*instance._context)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCompressor._context)) == 8, "_ENetCompressor._context has unexpected size % instead of 8", size_of(type_of(_ENetCompressor._context)));
        assert(((cast(*void)(*instance.compress)) - cast(*void)(*instance)) == 8, "_ENetCompressor.compress has unexpected offset % instead of 8", ((cast(*void)(*instance.compress)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCompressor.compress)) == 8, "_ENetCompressor.compress has unexpected size % instead of 8", size_of(type_of(_ENetCompressor.compress)));
        assert(((cast(*void)(*instance.decompress)) - cast(*void)(*instance)) == 16, "_ENetCompressor.decompress has unexpected offset % instead of 16", ((cast(*void)(*instance.decompress)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCompressor.decompress)) == 8, "_ENetCompressor.decompress has unexpected size % instead of 8", size_of(type_of(_ENetCompressor.decompress)));
        assert(((cast(*void)(*instance.destroy)) - cast(*void)(*instance)) == 24, "_ENetCompressor.destroy has unexpected offset % instead of 24", ((cast(*void)(*instance.destroy)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetCompressor.destroy)) == 8, "_ENetCompressor.destroy has unexpected size % instead of 8", size_of(type_of(_ENetCompressor.destroy)));
        assert(size_of(_ENetCompressor) == 32, "_ENetCompressor has size % instead of 32", size_of(_ENetCompressor));
    }

    {
        instance: _ENetHost;
        assert(((cast(*void)(*instance.socket)) - cast(*void)(*instance)) == 0, "_ENetHost.socket has unexpected offset % instead of 0", ((cast(*void)(*instance.socket)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.socket)) == 8, "_ENetHost.socket has unexpected size % instead of 8", size_of(type_of(_ENetHost.socket)));
        assert(((cast(*void)(*instance.address)) - cast(*void)(*instance)) == 8, "_ENetHost.address has unexpected offset % instead of 8", ((cast(*void)(*instance.address)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.address)) == 8, "_ENetHost.address has unexpected size % instead of 8", size_of(type_of(_ENetHost.address)));
        assert(((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)) == 16, "_ENetHost.incomingBandwidth has unexpected offset % instead of 16", ((cast(*void)(*instance.incomingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.incomingBandwidth)) == 4, "_ENetHost.incomingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetHost.incomingBandwidth)));
        assert(((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)) == 20, "_ENetHost.outgoingBandwidth has unexpected offset % instead of 20", ((cast(*void)(*instance.outgoingBandwidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.outgoingBandwidth)) == 4, "_ENetHost.outgoingBandwidth has unexpected size % instead of 4", size_of(type_of(_ENetHost.outgoingBandwidth)));
        assert(((cast(*void)(*instance.bandwidthThrottleEpoch)) - cast(*void)(*instance)) == 24, "_ENetHost.bandwidthThrottleEpoch has unexpected offset % instead of 24", ((cast(*void)(*instance.bandwidthThrottleEpoch)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.bandwidthThrottleEpoch)) == 4, "_ENetHost.bandwidthThrottleEpoch has unexpected size % instead of 4", size_of(type_of(_ENetHost.bandwidthThrottleEpoch)));
        assert(((cast(*void)(*instance.mtu)) - cast(*void)(*instance)) == 28, "_ENetHost.mtu has unexpected offset % instead of 28", ((cast(*void)(*instance.mtu)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.mtu)) == 4, "_ENetHost.mtu has unexpected size % instead of 4", size_of(type_of(_ENetHost.mtu)));
        assert(((cast(*void)(*instance.randomSeed)) - cast(*void)(*instance)) == 32, "_ENetHost.randomSeed has unexpected offset % instead of 32", ((cast(*void)(*instance.randomSeed)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.randomSeed)) == 4, "_ENetHost.randomSeed has unexpected size % instead of 4", size_of(type_of(_ENetHost.randomSeed)));
        assert(((cast(*void)(*instance.recalculateBandwidthLimits)) - cast(*void)(*instance)) == 36, "_ENetHost.recalculateBandwidthLimits has unexpected offset % instead of 36", ((cast(*void)(*instance.recalculateBandwidthLimits)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.recalculateBandwidthLimits)) == 4, "_ENetHost.recalculateBandwidthLimits has unexpected size % instead of 4", size_of(type_of(_ENetHost.recalculateBandwidthLimits)));
        assert(((cast(*void)(*instance.peers)) - cast(*void)(*instance)) == 40, "_ENetHost.peers has unexpected offset % instead of 40", ((cast(*void)(*instance.peers)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.peers)) == 8, "_ENetHost.peers has unexpected size % instead of 8", size_of(type_of(_ENetHost.peers)));
        assert(((cast(*void)(*instance.peerCount)) - cast(*void)(*instance)) == 48, "_ENetHost.peerCount has unexpected offset % instead of 48", ((cast(*void)(*instance.peerCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.peerCount)) == 8, "_ENetHost.peerCount has unexpected size % instead of 8", size_of(type_of(_ENetHost.peerCount)));
        assert(((cast(*void)(*instance.channelLimit)) - cast(*void)(*instance)) == 56, "_ENetHost.channelLimit has unexpected offset % instead of 56", ((cast(*void)(*instance.channelLimit)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.channelLimit)) == 8, "_ENetHost.channelLimit has unexpected size % instead of 8", size_of(type_of(_ENetHost.channelLimit)));
        assert(((cast(*void)(*instance.serviceTime)) - cast(*void)(*instance)) == 64, "_ENetHost.serviceTime has unexpected offset % instead of 64", ((cast(*void)(*instance.serviceTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.serviceTime)) == 4, "_ENetHost.serviceTime has unexpected size % instead of 4", size_of(type_of(_ENetHost.serviceTime)));
        assert(((cast(*void)(*instance.dispatchQueue)) - cast(*void)(*instance)) == 72, "_ENetHost.dispatchQueue has unexpected offset % instead of 72", ((cast(*void)(*instance.dispatchQueue)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.dispatchQueue)) == 16, "_ENetHost.dispatchQueue has unexpected size % instead of 16", size_of(type_of(_ENetHost.dispatchQueue)));
        assert(((cast(*void)(*instance.totalQueued)) - cast(*void)(*instance)) == 88, "_ENetHost.totalQueued has unexpected offset % instead of 88", ((cast(*void)(*instance.totalQueued)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.totalQueued)) == 4, "_ENetHost.totalQueued has unexpected size % instead of 4", size_of(type_of(_ENetHost.totalQueued)));
        assert(((cast(*void)(*instance.packetSize)) - cast(*void)(*instance)) == 96, "_ENetHost.packetSize has unexpected offset % instead of 96", ((cast(*void)(*instance.packetSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.packetSize)) == 8, "_ENetHost.packetSize has unexpected size % instead of 8", size_of(type_of(_ENetHost.packetSize)));
        assert(((cast(*void)(*instance.headerFlags)) - cast(*void)(*instance)) == 104, "_ENetHost.headerFlags has unexpected offset % instead of 104", ((cast(*void)(*instance.headerFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.headerFlags)) == 2, "_ENetHost.headerFlags has unexpected size % instead of 2", size_of(type_of(_ENetHost.headerFlags)));
        assert(((cast(*void)(*instance.commands)) - cast(*void)(*instance)) == 106, "_ENetHost.commands has unexpected offset % instead of 106", ((cast(*void)(*instance.commands)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.commands)) == 1536, "_ENetHost.commands has unexpected size % instead of 1536", size_of(type_of(_ENetHost.commands)));
        assert(((cast(*void)(*instance.commandCount)) - cast(*void)(*instance)) == 1648, "_ENetHost.commandCount has unexpected offset % instead of 1648", ((cast(*void)(*instance.commandCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.commandCount)) == 8, "_ENetHost.commandCount has unexpected size % instead of 8", size_of(type_of(_ENetHost.commandCount)));
        assert(((cast(*void)(*instance.buffers)) - cast(*void)(*instance)) == 1656, "_ENetHost.buffers has unexpected offset % instead of 1656", ((cast(*void)(*instance.buffers)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.buffers)) == 1040, "_ENetHost.buffers has unexpected size % instead of 1040", size_of(type_of(_ENetHost.buffers)));
        assert(((cast(*void)(*instance.bufferCount)) - cast(*void)(*instance)) == 2696, "_ENetHost.bufferCount has unexpected offset % instead of 2696", ((cast(*void)(*instance.bufferCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.bufferCount)) == 8, "_ENetHost.bufferCount has unexpected size % instead of 8", size_of(type_of(_ENetHost.bufferCount)));
        assert(((cast(*void)(*instance.checksum)) - cast(*void)(*instance)) == 2704, "_ENetHost.checksum has unexpected offset % instead of 2704", ((cast(*void)(*instance.checksum)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.checksum)) == 8, "_ENetHost.checksum has unexpected size % instead of 8", size_of(type_of(_ENetHost.checksum)));
        assert(((cast(*void)(*instance.compressor)) - cast(*void)(*instance)) == 2712, "_ENetHost.compressor has unexpected offset % instead of 2712", ((cast(*void)(*instance.compressor)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.compressor)) == 32, "_ENetHost.compressor has unexpected size % instead of 32", size_of(type_of(_ENetHost.compressor)));
        assert(((cast(*void)(*instance.packetData)) - cast(*void)(*instance)) == 2744, "_ENetHost.packetData has unexpected offset % instead of 2744", ((cast(*void)(*instance.packetData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.packetData)) == 8192, "_ENetHost.packetData has unexpected size % instead of 8192", size_of(type_of(_ENetHost.packetData)));
        assert(((cast(*void)(*instance.receivedAddress)) - cast(*void)(*instance)) == 10936, "_ENetHost.receivedAddress has unexpected offset % instead of 10936", ((cast(*void)(*instance.receivedAddress)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.receivedAddress)) == 8, "_ENetHost.receivedAddress has unexpected size % instead of 8", size_of(type_of(_ENetHost.receivedAddress)));
        assert(((cast(*void)(*instance.receivedData)) - cast(*void)(*instance)) == 10944, "_ENetHost.receivedData has unexpected offset % instead of 10944", ((cast(*void)(*instance.receivedData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.receivedData)) == 8, "_ENetHost.receivedData has unexpected size % instead of 8", size_of(type_of(_ENetHost.receivedData)));
        assert(((cast(*void)(*instance.receivedDataLength)) - cast(*void)(*instance)) == 10952, "_ENetHost.receivedDataLength has unexpected offset % instead of 10952", ((cast(*void)(*instance.receivedDataLength)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.receivedDataLength)) == 8, "_ENetHost.receivedDataLength has unexpected size % instead of 8", size_of(type_of(_ENetHost.receivedDataLength)));
        assert(((cast(*void)(*instance.totalSentData)) - cast(*void)(*instance)) == 10960, "_ENetHost.totalSentData has unexpected offset % instead of 10960", ((cast(*void)(*instance.totalSentData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.totalSentData)) == 4, "_ENetHost.totalSentData has unexpected size % instead of 4", size_of(type_of(_ENetHost.totalSentData)));
        assert(((cast(*void)(*instance.totalSentPackets)) - cast(*void)(*instance)) == 10964, "_ENetHost.totalSentPackets has unexpected offset % instead of 10964", ((cast(*void)(*instance.totalSentPackets)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.totalSentPackets)) == 4, "_ENetHost.totalSentPackets has unexpected size % instead of 4", size_of(type_of(_ENetHost.totalSentPackets)));
        assert(((cast(*void)(*instance.totalReceivedData)) - cast(*void)(*instance)) == 10968, "_ENetHost.totalReceivedData has unexpected offset % instead of 10968", ((cast(*void)(*instance.totalReceivedData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.totalReceivedData)) == 4, "_ENetHost.totalReceivedData has unexpected size % instead of 4", size_of(type_of(_ENetHost.totalReceivedData)));
        assert(((cast(*void)(*instance.totalReceivedPackets)) - cast(*void)(*instance)) == 10972, "_ENetHost.totalReceivedPackets has unexpected offset % instead of 10972", ((cast(*void)(*instance.totalReceivedPackets)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.totalReceivedPackets)) == 4, "_ENetHost.totalReceivedPackets has unexpected size % instead of 4", size_of(type_of(_ENetHost.totalReceivedPackets)));
        assert(((cast(*void)(*instance.intercept)) - cast(*void)(*instance)) == 10976, "_ENetHost.intercept has unexpected offset % instead of 10976", ((cast(*void)(*instance.intercept)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.intercept)) == 8, "_ENetHost.intercept has unexpected size % instead of 8", size_of(type_of(_ENetHost.intercept)));
        assert(((cast(*void)(*instance.connectedPeers)) - cast(*void)(*instance)) == 10984, "_ENetHost.connectedPeers has unexpected offset % instead of 10984", ((cast(*void)(*instance.connectedPeers)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.connectedPeers)) == 8, "_ENetHost.connectedPeers has unexpected size % instead of 8", size_of(type_of(_ENetHost.connectedPeers)));
        assert(((cast(*void)(*instance.bandwidthLimitedPeers)) - cast(*void)(*instance)) == 10992, "_ENetHost.bandwidthLimitedPeers has unexpected offset % instead of 10992", ((cast(*void)(*instance.bandwidthLimitedPeers)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.bandwidthLimitedPeers)) == 8, "_ENetHost.bandwidthLimitedPeers has unexpected size % instead of 8", size_of(type_of(_ENetHost.bandwidthLimitedPeers)));
        assert(((cast(*void)(*instance.duplicatePeers)) - cast(*void)(*instance)) == 11000, "_ENetHost.duplicatePeers has unexpected offset % instead of 11000", ((cast(*void)(*instance.duplicatePeers)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.duplicatePeers)) == 8, "_ENetHost.duplicatePeers has unexpected size % instead of 8", size_of(type_of(_ENetHost.duplicatePeers)));
        assert(((cast(*void)(*instance.maximumPacketSize)) - cast(*void)(*instance)) == 11008, "_ENetHost.maximumPacketSize has unexpected offset % instead of 11008", ((cast(*void)(*instance.maximumPacketSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.maximumPacketSize)) == 8, "_ENetHost.maximumPacketSize has unexpected size % instead of 8", size_of(type_of(_ENetHost.maximumPacketSize)));
        assert(((cast(*void)(*instance.maximumWaitingData)) - cast(*void)(*instance)) == 11016, "_ENetHost.maximumWaitingData has unexpected offset % instead of 11016", ((cast(*void)(*instance.maximumWaitingData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetHost.maximumWaitingData)) == 8, "_ENetHost.maximumWaitingData has unexpected size % instead of 8", size_of(type_of(_ENetHost.maximumWaitingData)));
        assert(size_of(_ENetHost) == 11024, "_ENetHost has size % instead of 11024", size_of(_ENetHost));
    }

    {
        instance: _ENetEvent;
        assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "_ENetEvent.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetEvent.type)) == 4, "_ENetEvent.type has unexpected size % instead of 4", size_of(type_of(_ENetEvent.type)));
        assert(((cast(*void)(*instance.peer)) - cast(*void)(*instance)) == 8, "_ENetEvent.peer has unexpected offset % instead of 8", ((cast(*void)(*instance.peer)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetEvent.peer)) == 8, "_ENetEvent.peer has unexpected size % instead of 8", size_of(type_of(_ENetEvent.peer)));
        assert(((cast(*void)(*instance.channelID)) - cast(*void)(*instance)) == 16, "_ENetEvent.channelID has unexpected offset % instead of 16", ((cast(*void)(*instance.channelID)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetEvent.channelID)) == 1, "_ENetEvent.channelID has unexpected size % instead of 1", size_of(type_of(_ENetEvent.channelID)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 20, "_ENetEvent.data has unexpected offset % instead of 20", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetEvent.data)) == 4, "_ENetEvent.data has unexpected size % instead of 4", size_of(type_of(_ENetEvent.data)));
        assert(((cast(*void)(*instance.packet)) - cast(*void)(*instance)) == 24, "_ENetEvent.packet has unexpected offset % instead of 24", ((cast(*void)(*instance.packet)) - cast(*void)(*instance)));
        assert(size_of(type_of(_ENetEvent.packet)) == 8, "_ENetEvent.packet has unexpected size % instead of 8", size_of(type_of(_ENetEvent.packet)));
        assert(size_of(_ENetEvent) == 32, "_ENetEvent has size % instead of 32", size_of(_ENetEvent));
    }
}

