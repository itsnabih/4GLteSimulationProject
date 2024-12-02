# GENERAL DESCRIPTION OF SINGLE CELL SIMULATION AND TOPOLOGY
## Description
This network simulation topology is designed to study the performance and quality of 4G LTE under various scenarios, including Video Streaming, VoIP, and Bi-Directional Traffic, using OMNeT++, INET 4.5, and Simu5G. The system integrates core network components like the Server, Router, Packet Gateway (PGW), and eNodeB, with multiple User Equipment (UEs). Below is a detailed explanation of the communication flow, device interactions, connection paths, values, and systematic simulation scenarios:

## Communication Flow and Device Connections
1. Server to Router:
  * The server connects to the router via Eth10G (10 Gbps Ethernet) links.
  * Traffic starts from the server's pppg++ gate to the router's pppg++ gate, ensuring high-speed data transfer for core network communications.
2. Router to PGW:
  * The router interfaces with the Packet Gateway (PGW) through another Eth10G connection.
  * The router forwards traffic from the server to the PGW, acting as a bridge between the server and the LTE radio access network.
3. PGW to eNodeB:
  * The PGW connects to the eNodeB through another Eth10G link.
  * The PGW handles core network functionalities such as user data tunneling and QoS management, ensuring seamless communication with the eNodeB.
4. eNodeB to UEs:
  * The eNodeB communicates wirelessly with UEs using LTE radio channels.
  * UEs are attached to the eNodeB through a PPP (Point-to-Point Protocol) interface, with each UE assigned a Cell ID (macCellId = 1) and Master ID (masterId = 1) to manage connectivity.
## Parameter Details
1. Number of UEs (numUe):
  * The simulation allows scaling from 1 to 100 UEs, configurable via the .ini file.
2. Mobility Constraints:
  * UEs are confined to an area of 300m x 800m for Video Streaming and 1000m x 1000m for VoIP and Bi-Directional scenarios.
  * Movement follows a LinearMobility model, with speeds between 1mps and 3mps.
3. Transmission Power:
  * eNodeB: 40 dBm (ensuring wide coverage).
  * UEs: 26 dBm (optimized for device-to-eNodeB communication).
4. Resource Blocks:
  * The network allocates 6 LTE resource blocks, balancing bandwidth and user demand.
## Application and Traffic Scenarios
1. Video Streaming:
* UE Configuration:
  * Each UE runs a UdpVideoStreamClient application to download video data.
  * UEs send requests to the server at port 3088, with a local port of 9999.
* Server Configuration:
  * The server hosts a UdpVideoStreamServer application.
  * It streams 10 MiB videos in 1000-byte packets at intervals of 20ms to all UEs, ensuring consistent delivery.
* QoS Settings:
  * Traffic is marked as HighPriority to minimize latency and ensure smooth video playback.
2. VoIP Communication:
* UE Configuration:
  * Each UE runs a VoIPReceiver, listening on port 3000.
* Server Configuration:
  * The server uses VoIPSender to transmit small 40-byte packets to UEs, with dynamic destPort and localPort assignments (3088 + UE index).
* QoS Settings:
  * VoIP traffic is also prioritized as HighPriority to ensure low-latency voice communication.
3. Bi-Directional Traffic:
  * Similar to the VoIP scenario but with traffic flowing in both directions between the server and UEs.
  * UEs and the server use the same ports as in the VoIP scenario, maintaining QoS guarantees.

## Systematic Simulation Workflow
1. Initialization:
  * The .ini file initializes global parameters like simulation time (20s), scalar/vector recording, and mobility constraints.
  * The network is set up with all components (server, router, PGW, eNodeB, UEs) instantiated.
2. IPv4 Configuration:
  * The Ipv4NetworkConfigurator loads settings from an external XML file (demo.xml) to assign IP addresses, routes, and link properties.
3. Channel Control:
  * The LteChannelControl manages LTE-specific radio communication, including channel assignment and interference handling.
4. Application Execution:
  * Applications on the server and UEs begin communication based on their configured start times (uniform(0s, 0.02s)).
  * For each scenario, specific traffic patterns (e.g., video packets, VoIP frames) are generated and transmitted.
5. Data Collection:
  * The RoutingTableRecorder logs routing paths for analysis.
  * Scalar and vector files capture performance metrics like throughput, delay, and packet loss.
6. QoS Management:
  * Carrier Aggregation enhances throughput by utilizing multiple LTE carriers.
  * Traffic is prioritized based on application types to meet QoS requirements.
## Relationship Between Devices
* The Server acts as the data source for UEs, hosting applications for video and VoIP services.
* The Router ensures efficient traffic forwarding between the server and PGW.
* The PGW serves as the gateway, enabling core-to-radio network integration.
* The eNodeB facilitates wireless connectivity, resource allocation, and scheduling for UEs.
* UEs represent end-users, consuming services provided by the server.
