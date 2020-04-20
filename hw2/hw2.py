import numpy as np
import os
import multiprocessing as mp
import time
import psutil
import pickle
import sys
import csv



'''
N: size of NxN matrix
returns:
A, B NxN random matrices
'''
def createMatrices(N, seed = 10):
    np.random.seed(seed)
    A = np.random.rand(N, N)
    B = np.random.rand(N, N)
    return A, B

'''
multiply two matrices together
columns of A == rows of B
'''
def multiply(A, B):
    #m rows x n cols; nA = mB
    mA, nA = A.shape
    mB, nB = B.shape
    mult = np.zeros((nA, nB))
    for i in range(mA):
        for j in range(nB):
            for k in range(nA):
                mult[i][j]+= A[i][k]*B[k][j]
    return mult

#worker process, can do more stats here
def worker(A, B):
    C = multiply(A, B)
    return


'''
take in size of matrix N to multiply and number of processes
'''
def run(N, num_proc, num_it = 1):
    A, B = createMatrices(N) #random NxN

    processes = []
    time_arr = []
    cpu_arr = []
    for _ in range(num_it):
        psutil.cpu_percent(None) #set counter for find cpu utilization
        starttime = time.time() #set initial time

        #spawn processes.  uses os.fork() under the hood
        for i in range(num_proc):
            process = mp.Process(target = worker,
                                 args = (A, B))
            processes.append(process)
            process.start()
        
        #wait for processes to end
        for process in processes:
            process.join()
        DT = time.time() - starttime #measure end time
        cpu = psutil.cpu_percent(percpu=True) #measure avg cpu utilization
        time_arr.append(DT)
        cpu_arr.append(cpu)


    return {'time_avg' : np.mean(time_arr),
            'time_std' : np.std(time_arr),
            'cpu_ut_avg' : np.mean(cpu_arr),
            'cpu_ut_std' : np.std(cpu_arr)}, cpu_arr, time_arr


if __name__=="__main__":
    N = np.power(2*np.ones(10), range(10)) # , range(10))
    num_proc = [1, 2, 4, 8, 16, 20]
    num_it = 10
    fieldnames = ['size_arr', 'num_proc',
                  'time_avg', 'time_std',
                  'cpu_ut_avg', 'cpu_ut_std']
    all_cpu = []
    all_time = []
    with open('stats.csv', 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

    for n in N:
        n = int(n)
        for proc in num_proc:

            stats, cpu, times = run(n, proc, num_it)

            with open('stats.csv', 'a', newline='') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                stats['size_arr'] = n
                stats['num_proc'] = proc
                print("DONE WITH N = " + str(n) + " and num_proc = " + str(proc))
                writer.writerow(stats)
                all_cpu.append(cpu)
                all_time.append(times)
    np.savez_compressed('raw_data', cpu = all_cpu, times = all_time)
    print("finished writing to the file, you can retrieve stats.csv now")

