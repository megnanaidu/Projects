import os, time, filecmp

def test_serial():
    os.system("gcc acc_serial.c -g -o acc_serial")
    start = time.time()
    os.system("./acc_serial")
    end = time.time()
    return end - start


def test_parallel():
    os.system("gcc acc_parallel.c -g -lpthread -o acc_parallel")
    start = time.time()
    os.system("./acc_parallel")
    end = time.time()
    return end - start

if __name__ == '__main__':
    serial = test_serial()
    parallel = test_parallel()

    if filecmp.cmp("serial_output.txt", "parallel_output.txt"):
        print("Benchmark success!")
    else:
        print("Benchmark failed, parallel and serial output do not match!")
        exit(-1)

    num_threads = 0
    with open('thread_info.h', 'r') as file:
        thread_line = file.readline().strip()
        
        # Split the line by spaces
        parts = thread_line.split()
        
        # Check if the line is in the expected format
        if len(parts) == 3 and parts[0] == '#define' and parts[1] == 'NUM_THREADS':
            # Extract the number of threads
            num_threads = int(parts[2])

    print("Number of threads: {}\nTime taken for serial:\t\t{}\nTime taken for parallel:\t{}\nSpeedup:\t\t\t{} X".format(num_threads,serial, parallel, round(serial/parallel, 2)))