#!/bin/bash
# for JetPack4.5.1 on Jetson NX
if [ $0 != "./setup.sh" ]; then
echo "Please execute under jetson_setup/shellscript_setup"
exit 1
fi

# 必須
sudo apt update
sudo apt upgrade -y 
sudo apt install -y build-essential python3-dev python3-pip v4l-utils guvcview
sudo pip3 install -U pip testresources setuptools==49.6.0 
echo 'PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
echo 'LD_PRELOAD="/usr/lib/aarch64-linux-gnu/libgomp.so.1"' >> ~/.bashrc
source ~/.bashrc

# TensorFlowのインストール
sudo apt install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
sudo pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
## TensorFlow==2.4.0+nv21.5
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 tensorflow

# PyTorchのインストール
## PyTorch==1.7.0
wget https://nvidia.box.com/shared/static/cs3xn3td6sfgtene6jdvsxlr366m2dhq.whl -O torch-1.7.0-cp36-cp36m-linux_aarch64.whl
sudo apt install -y libopenblas-base libopenmpi-dev
pip3 install torch-1.7.0-cp36-cp36m-linux_aarch64.whl

## Torchvision==0.8.0
sudo apt install -y libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev
pip3 install pillow==8.2.0
git clone --branch v0.8.1 https://github.com/pytorch/vision torchvision
cd torchvision
export BUILD_VERSION=0.8.0
sudo python3 setup.py install
cd ..

# YOLOv5に必要なパッケージのインストール
sudo pip3 install -U scipy==1.4.1
pip3 install matplotlib==3.3.4 Cython PyYAML==5.3.1  tqdm==4.41.1 seaborn

# v4l2の修正パッチを適用
wget https://forums.developer.nvidia.com/uploads/short-url/4L6p6Cir0SN8YTDMy1z8vrgU6oF.zip -O nvargus.zip
unzip nvargus.zip
sudo cp Topic168303_Apr21_libv4l2_nvargus.so /usr/lib/aarch64-linux-gnu/tegra/libv4l2_nvargus.so

# firefox
sudo apt install iceweasel

# ricty-diminished
wget -O ricty.tar.gz https://github.com/edihbrandon/RictyDiminished/archive/refs/tags/3.2.3.tar.gz
tar -zxvf ricty.tar.gz
mkdir ~/.fonts
cp RictyDiminished-3.2.3/*.ttf ~/.fonts/

# vscode
wget -O VSCode-linux-arm64.tar.gz 'https://code.visualstudio.com/sha/download?build=insider&os=linux-arm64'
tar -zxvf VSCode-linux-arm64.tar.gz
mv VSCode-linux-arm64 ~/
echo 'PATH="$PATH:~/VSCode-linux-arm64/bin"' >> ~/.bashrc
source ~/.bashrc

# テスト
python3 test/tf_test.py
python3 test/yolov5_test/detect.py --weights test/yolov5_test/weights/yolov5s.pt --source 0 --conf 0.25

# ibus-mozc
sudo apt install ibus-mozc
ibus restart
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'jp'), ('ibus', 'mozc-jp')]"
sudo reboot