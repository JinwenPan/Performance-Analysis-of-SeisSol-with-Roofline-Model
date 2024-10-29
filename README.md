# Performance-Analysis-of-SeisSol-with-Roofline-Model

This repository is for storing the resources of a module of 10 ECTS credits called Guided Research at the Technical University of Munich. For the vast majority of programs at German and even European universities, the standard workload for one academic year corresponds to 60 ECTS credits. 

**Title:** Performance Evaluation of Acoustic Model Implementation in SeisSol Using Roofline Model  

**Supervisor:** Prof. Dr. Michael Georg Bader at the Chair of Scientific Computing  

**Duration:** April 2024 -- August 2024  

**Abstract:** SeisSol is a high-performance software framework widely used for simulating seismic wave propagation and dynamic rupture processes. The incorporation of the acoustic wave model, which is crucial for accurately representing the natural processes in SeisSol, presents new performance challenges. The acoustic wave model, consisting of four partial differential equations (PDEs), is a special case of the elastic wave model, which comprises nine PDEs. Based on this, in the current version of SeisSol, the acoustic model is implemented by setting the second Lamé parameter to zero within the elastic model, which leads to unnecessary resource usage. We implement a standalone acoustic model for SeisSol's proxy application, evaluate its performance improvements using the roofline model, and analyze its cache utilization. Although the performance bottlenecks have not significantly changed, the runtime and memory data volume have been reduced by approximately half under several typical test conditions, while the last-level cache (LLC) miss rate has increased by up to about 17%. Additionally, the process of building the roofline model on the Leibniz Supercomputing Center (LRZ)'s CoolMUC-2 cluster, along with its advantages and limitations, is discussed.

For any questions or clarifications, please contact me at jinwen.pan@tum.de.
