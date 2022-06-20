## Check GPU usage
```console
watch -n -1 nvidia-smi
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
