Team 001: Plan for HW2

Question: How can we get the best multiprogramming ability from EC2 instances with a fixed budget? 

Independent Variables: Different EC2 instances based on memory capacity, computing performance (number of cores), and cost

Measures: CPU Utility, Memory Usage, Latency, Speedup vs Number of processes

Hypothesis: Multiprogramming ability can be measured by the number of processes when CPU utility reaches the maximum point. When the number of processes does not exceed this point, the CPU is not fully used. After this point, cache and memory are not large enough to support all processes and they have to frequently require disk I/O, which leads to the decrease of CPU utilization called "Thrashing". 

Due to various cache and memory configuration of different types of EC2 instances, they have different multiprogramming levels. We want to check the maximum multiprogramming ability of different AWS EC2 instances.

Experiment: 
1. It is more reasonable to measure the multiprogramming ability with a standard test program. We first write a python script that consumes a large size of memory and CPU time.
2. Write a driver script which keeps forking new processes with the standard test program and measure the CPU utility at the same time. 
3. Get the multiprogramming level curve for different types of EC2 instances. 
4. Compared the spot prices of EC2 instances and their multiprogramming levels. Conclude which one is attractive at a reasonable price. 

Timeline:
4/16 8pm : Get scripts and code working for (i) matrix multiplication, (ii) Forking new processes, (iii) measuring CPU utility + meeting for what experiments to run 
4/18 : Data Science (experiments + visualization) deadline 
4/19 : Rough draft Jupyter notebook
4/21 : Final draft of Jupyter notebook with explanations, code, visualizations, with presentation enabled
