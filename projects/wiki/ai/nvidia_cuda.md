# NVIDIA and CUDA related commands on LINUX

- `sudo lshw -C display` : shows the display hardware or GPU info
- `which nvcc` : to check if the nvidia cuda compiler is installed
- `nvcc --version` : to get the CUDA compiler version which matches the toolkit version:
- `cat /proc/driver/nvidia/version` : check the CUDA version by using the kernel
- `nvidia-smi` : launches the System Management Interface command line tool provides all the above info
- Compilation example using `nvcc` and to run it automatically:
```console
nvcc -arch=sm_61 -o <output_path/filename> <input_path/file.cu> -run
```

## NSight Systems NSYS

- `nsys-ui` : to launch it download and install Nsight Systems from [Nvidia Developer Download Center](https://developer.nvidia.com/gameworksdownload#?dn=nsight-systems-2022-3). Do not confuse with Nvidia Nsight Graphics
- The source documentation can be found [here](https://docs.nvidia.com/nsight-systems/UserGuide/index.html#example-nsys-stats)
- `nsys profile --stats=true <executable>` : will create a sqlite and a nsys-rep file reports
- `nsys stats report1.nsys-rep` : will open in text mode the report

- [nvcc documentation](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html)
- [flags options for nvcc](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#gpu-feature-list)

## Check GPU usage
```console
watch -n -1 nvidia-smi
```

## Cuda Configurations

### Numa node availability
- **numa** stands for _Non-Uniform Memory Access__(NUMA). It refers to multiprocessor systems whose memory is divided into multiple memory nodes. The access time of a memory node depends on the relative locations of the accessing CPU and the accessed node.
- Sometimes one will get the following warnings:
```console
I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:975] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
```
- NUMA is a method of configuring a cluster of microprocessor in a multiprocessing system so that they can share memory locally, improving performance and the ability of the system to be expanded. NUMA is used in a symmetric multiprocessing (SMP) system.
- So we need to change its value from -1 to 0. For that we use the following script:
```bash
for a in /sys/bus/pci/devices/*; do echo 0 | sudo tee -a $a/numa_node; done
```

## Install `cuda`, `cudatoolkit` and `cudnn` for local GPU usage
1. On Arch Linux you need to first install 
```console
sudo pacman -S cuda
```
2. In your conda environment if you plan to use your own GPU for TensorFlow and Pytorch, then:
```console
conda install cudatoolkit
conda install cudnn
```
3. Install `cuda-tools` to have access to Nsight Systems and another tools:
```console
sudo pacman -S cuda-tools
```

