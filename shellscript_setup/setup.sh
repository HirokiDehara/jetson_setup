#!/bin/bash
# for JetPack4.5.1

# 必須
sudo apt update
sudo apt install python3-pip build-essential
sudo pip3 install -U pip testresources setuptools==49.6.0 
echo 'PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
echo 'LD_PRELOAD="/usr/lib/aarch64-linux-gnu/libgomp.so.1"' >> ~/.bashrc

# TensorFlowのインストール
sudo apt install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
sudo pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
## TensorFlow==2.3.1+nv20.12
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 tensorflow

# PyTorchのインストール
## PyTorch==1.7.0
wget https://nvidia.box.com/shared/static/cs3xn3td6sfgtene6jdvsxlr366m2dhq.whl -O torch-1.7.0-cp36-cp36m-linux_aarch64.whl
sudo apt install libopenblas-base libopenmpi-dev
pip3 install Cython
pip3 install torch-1.7.0-cp36-cp36m-linux_aarch64.whl

## Torchvision==0.8.0
sudo apt install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev
git clone --branch v0.8.1 https://github.com/pytorch/vision torchvision
cd torchvision
export BUILD_VERSION=0.8.0
python3 setup.py install
cd ..

## yolov5に必要なパッケージのインストール
pip3 install tqdm
pip3 install seaborn
pip3 install 'pillow<7'