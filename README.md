# Omnetpp 4GLte Simulation with INET4.5 and Simu5G<br>
<img src="https://simu5g.org/_images/hero-banner.png" alt="Logo" width="600">

This project defines singlecell and multicell LTE network simulation with three eNodeBs (cells) handling varying numbers of user equipment (UEs), namely 10, 20, 50, or 100 UEs. The simulation area covers a 2000m x 2000m region, with UEs having mobility that can be static or linear with random speeds between 1 to 3 m/s. Each UE is dynamically connected to one of the cells through a resource allocation mechanism using MAXCI scheduling algorithm for uplink and downlink. The applications used include Video Streaming, VoIP, and BiDirectional Traffic, where each configuration has a different focus. In the Video Streaming scenario, the UE downloads a 10 MiB video from the server with high QoS priority, while the VoIP and BiDirectional Traffic scenarios simulate two-way voice data transmission between the UE and server with small packet sizes to ensure optimal voice communication performance. <br>
<br>
The simulation records a number of QoS metrics, including latency, throughput, jitter, and packet loss. These measurements aim to evaluate network performance under various traffic scenarios, both static and dynamic. In addition, the transmission power of the eNodeB is set at 40 dBm and the UE at 26 dBm to ensure adequate signal coverage. The simulation is designed to analyze the efficiency of multicell networks in handling UE mobility, resource allocation, and quality of service (QoS) in various applications. The output in the form of scalar and vector files enables in-depth analysis of network performance, especially in scenarios with video traffic that requires high throughput and voice traffic that is sensitive to latency and jitter.

## **QoS Parameters:**
* Latency: Delay time for different types of applications.
* Throughput: The bandwidth used, especially for Video Streaming applications.
* Jitter: Inter-packet timing stability, important for VoIP.
* Packet Loss: The rate of packet loss in the network.

url: https://inet.omnetpp.org/ <br>
url: https://simu5g.org/
