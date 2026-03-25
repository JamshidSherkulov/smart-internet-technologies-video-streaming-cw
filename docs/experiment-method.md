# Experiment Methodology

## Smart Internet Technologies Coursework

------------------------------------------------------------------------

## 1. Objective

The objective of this experiment is to evaluate the impact of network
conditions on MPEG-DASH video streaming Quality of Experience (QoE)
using two virtual machines (Server and Client).

------------------------------------------------------------------------

## 2. Experimental Setup

### 2.1 Virtual Environment

-   VirtualBox was used to create two VMs:
    -   Server VM (Ubuntu-Prometheus)
    -   Client VM (Ubuntu)

### 2.2 Network Configuration

-   VMs connected via Host-Only / Internal Network
-   Communication verified using `ping`

------------------------------------------------------------------------

## 3. System Architecture

Client VM (VLC Player) → DASH Player → HTTP → Apache Server → DASH Files
(MPD + Segments)

------------------------------------------------------------------------

## 4. Video Preparation

-   Two HD videos were selected:
    -   Car (high motion)
    -   City (low motion)

### Transcoding

Videos were transcoded using FFmpeg into: - 1.5 Mbps - 2.0 Mbps - 4.0
Mbps

### DASH Packaging

-   FFmpeg used to generate:
    -   manifest.mpd
    -   segment files (.m4s)

------------------------------------------------------------------------

## 5. Server Configuration

-   Apache web server installed
-   DASH files stored in: /var/www/html/dash/
-   HTTP URLs used for streaming

------------------------------------------------------------------------

## 6. Client Playback

-   VLC Media Player used as DASH client
-   Videos accessed via network stream (MPD URL)

------------------------------------------------------------------------

## 7. Traffic Generation

### SCTP using iPerf3

-   SCTP module enabled
-   iPerf3 compiled with SCTP support
-   Traffic generated between client and server

Purpose: - Simulate background traffic - Create network congestion
conditions

------------------------------------------------------------------------

## 8. Network Scenarios (Traffic Control)

Linux Traffic Control (tc) applied on Client VM:

### TBF

-   Rate: 2.5 Mbps
-   Burst: 20k
-   Latency: 50ms

### HTB

-   Min bandwidth: 2.5 Mbps
-   Max bandwidth: 5 Mbps
-   Burst: 20k

### Traffic Policing

-   Drop packets above 3.5 Mbps

------------------------------------------------------------------------

## 9. Testing Procedure

For each scenario: 1. Apply traffic control rule 2. Start SCTP traffic
using iPerf3 3. Play video in VLC 4. Observe: - Startup delay -
Buffering - Smoothness - Visual quality 5. Record observations

------------------------------------------------------------------------

## 10. MOS Evaluation

-   MOS assigned based on ITU-T BT.500 guidelines
-   Scale from 1 (Bad) to 5 (Excellent)
-   Evaluated for both videos under all scenarios

------------------------------------------------------------------------

## 11. Data Collection

-   Observations recorded in results files
-   Screenshots taken for:
    -   Playback
    -   Traffic control
    -   iPerf output

------------------------------------------------------------------------

## 12. Analysis Approach

-   Compare MOS across scenarios
-   Evaluate impact of:
    -   Bandwidth limitation
    -   Packet loss
    -   Traffic prioritization
-   Compare high-motion vs low-motion video performance

------------------------------------------------------------------------

## 13. Conclusion of Methodology

This methodology provides a structured approach to evaluate QoE under
controlled network conditions, enabling analysis of adaptive streaming
performance.
