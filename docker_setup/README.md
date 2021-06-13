# jetson_setup

[こちら](https://github.com/dusty-nv/jetson-containers)を参考に作成した docker を用いての jetson 環境構築方法です。

以下のパッケージを含む環境を構築することができます。

```python
pytorch==1.7.0
torchvision==0.8.0a0+45f960c
torchaudio==0.7.0a0+ac17b64
tensorflow==2.4.0+nv21.5
TensorRT==7.1.3.0
PyCUDA==2020.1
CuPy==8.0.0b4
numpy==1.19.4
numba==0.52.0
onnx==1.8.0
OpenCV==4.1.1
pandas==1.1.5
scipy==1.5.4
sklearn==0.24.0
v4l2
```

全体の流れは[Jetson セットアップマニュアル](https://docs.google.com/presentation/d/1_k0xrD2JAzbs0CmXLibpOElClcySRwRvlrgityWFmZU/edit#slide=id.gd2481a1571_0_26)に記載してあります。

# 手順

1. まず GitHub から clone してファイルをダウンロードします。

   ```bash
   $ git clone https://github.com/Hutzper-inc/jetson_setup.git
   $ cd jetson_setup
   ```

1. ダウンロードしたファイルに実行権限を与えます。

   ```bash
   $ chmod 700 -R test run.sh
   ```
   
1. 用意された Dockerfile をビルドします。
   $CONTAINERNAME には任意のコンテナ名を記載してください。

   ```bash
   $ docker build -t $CONTAINERNAME -f Dockerfile.hutzper . 
   ```
   "Successfully built $CONTAINERNAME"と表示されていればビルド完了です。
   

1. 最後にコンテナを走らせて環境構築完了です。

   ```bash
   $ ./run.sh $CONTAINERNAME
   ```

1. 終了する際は以下のコマンドを実行してください。
   ```
   $ exit
   ```
