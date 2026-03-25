# MOS Summary and QoE Evaluation

## Smart Internet Technologies Coursework

------------------------------------------------------------------------

## 1. Introduction

This section presents the Mean Opinion Score (MOS) evaluation of video
streaming under different network conditions. MOS is a subjective
quality metric that reflects user perception of video playback quality.

The evaluation follows ITU-T BT.500 recommendations.

------------------------------------------------------------------------

## 2. MOS Scale

  Score   Quality
  ------- -----------
  5       Excellent
  4       Good
  3       Fair
  2       Poor
  1       Bad

------------------------------------------------------------------------

## 3. Evaluation Criteria

The following factors were considered when assigning MOS:

-   Startup delay
-   Buffering frequency
-   Playback smoothness
-   Visual quality
-   Overall user experience

------------------------------------------------------------------------

## 4. Results Summary

  Scenario            Car Video   City Video
  ------------------- ----------- ------------
  Baseline            5           5
  TBF (2.5 Mbps)      3           4
  HTB (2.5--5 Mbps)   4           4
  Traffic Policing    2           3

------------------------------------------------------------------------

## 5. Observations

### Baseline

-   Both videos played smoothly with no buffering
-   Excellent quality observed

### TBF

-   Bandwidth limitation caused noticeable degradation
-   Car video affected more due to fast motion
-   City video remained relatively stable

### HTB

-   Better performance than TBF due to flexible bandwidth
-   Minor degradation observed

### Traffic Policing

-   Packet dropping caused interruptions and poor playback
-   Car video significantly affected
-   City video moderately affected

------------------------------------------------------------------------

## 6. Key Insights

-   High-motion video (car) requires higher bandwidth
-   Low-motion video (city) tolerates lower bandwidth
-   Strict bandwidth limitation reduces QoE significantly
-   Flexible bandwidth allocation improves user experience
-   Packet loss has the most negative impact on QoE

------------------------------------------------------------------------

## 7. Conclusion

The MOS evaluation demonstrates that network conditions significantly
affect video streaming quality. Adaptive streaming systems perform
better when bandwidth is flexible (HTB) compared to strict limitations
(TBF) or packet dropping (policing).

These results highlight the importance of network management and
adaptive bitrate streaming in maintaining high Quality of Experience
(QoE).
