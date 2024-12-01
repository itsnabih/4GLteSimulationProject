# Multicell Simulation Description

This simulation file sets up a multicell LTE network environment with three eNodeBs and a varying number of User Equipment (UE) (10, 20, 50, or 100 devices). The simulation area covers a space of 2000m x 2000m, where the UE initial positions are randomly set within the range of 400m to 800m for X and Y coordinates. UE mobility can be **StationaryMobility** for a fixed position or **LinearMobility** with a random speed between 1mps to 3mps. Each UE is randomly connected to one of the cells using the **macCellId** parameter, which is then associated with the corresponding eNodeB via **masterId**.


The simulation lasts for 20 seconds and records various Quality of Service (QoS) metrics, including **latency**, **throughput**, **jitter**, and **packet loss**, with data stored in scalar (*.sca) and vector (*.vec) files. The network configuration involves an eNodeB transmission power of 40 dBm and a UE of 26 dBm. This file also uses automatic IP configuration from an external XML file (*demo.xml*).


Three application scenarios were tested, namely **Video Streaming**, **VoIP**, and **BiDirectional Traffic**. In the Video Streaming scenario, the UE downloads a video from the server with a size of 10 MiB. The server sends data through the **UdpVideoStreamServer** application with a sending interval of 20ms and a packet size of 1000B. QoS is set at high priority to ensure smooth streaming. The VoIP scenario simulates voice communication with a small packet size (40 bytes) between the UE and the server, where **VoIPSender** and **VoIPReceiver** applications are used. The BiDirectional Traffic scenario extends the VoIP simulation with bidirectional communication between the UE and the server using **MAXCI** algorithm-based uplink and downlink scheduling.

The simulation output is detailed data that includes per-event metrics (vector) and aggregate measurements (scalar), enabling analysis of multicell network performance in the face of video and voice traffic load, UE mobility, and network resource allocation efficiency.
