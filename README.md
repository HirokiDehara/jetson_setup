# jetson_setup

[こちら](https://github.com/dusty-nv/jetson-containers)を参考に作成した docker を用いての jetson 環境構築方法です。

以下のパッケージを含む環境を構築することができます。

```python
tensorflow==2.3.1+nv20.11
TensorRT==7.1.3.0
PyCUDA==2020.1
numpy==1.18.5
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
   $ chmod 700 -R scripts run.sh
   ```
   
1. 用意された Dockerfile をビルドします。

   ```bash
   $ docker build -t $CONTAINERNAME . 
   ```
   "Successfully built xxx"と表示されていればビルド完了です。
   

1. 最後にコンテナを走らせて環境構築完了です。

   ```bash
   $ ./run.sh $CONTAINERNAME
   ```

1. 終了する際は以下のコマンドを実行してください。
   ```
   $ exit
   ```
