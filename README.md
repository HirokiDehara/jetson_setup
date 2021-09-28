# やること一覧
## 1. JetPack4.5.1のダウンロード
こちらからJetPack4.5.1のイメージをダウンロードして解凍する。  
（5GBくらいあって毎回ダウンロードするのはめんどいので、専用のPCを用意しといた方がいいかも？）
https://developer.nvidia.com/jetpack-sdk-451-archive

Xavier NX, Nano, Nano 2GB の中から、今回セットアップする製品と同一のものを選択してダウンロード。  
![setup](https://user-images.githubusercontent.com/60293562/134911421-9a1ecf7c-feb5-41cd-9d3a-d7ef6e44a2c2.png)


## 2. OSイメージの書き込み
まず、以下のSD Card Formatterというツールを使ってSDカードをフォーマットしておく。  
https://www.sdcard.org/downloads/formatter_4/eula_windows/  
フォーマットは新品のSDでも行っておいた方がよい。

次に、Etcherを使って1.でダウンロードしたosイメージをSDカードに書き込む。   
Etcherはこちら。  
https://www.balena.io/etcher

## 3. JetPack4.5.1のインストール
1.でイメージを書き込んだSDカードをJetsonに挿して電源を入れる。
ディスプレイとつないだ状態で電源を入れること。

## 4. setup.pyを実行 (このファイル)
カメラにつないだ状態で、ホームディレクトリで以下を実行する。
```
git clone https://github.com/Hutzper-inc/jetson_setup
cd jetson_setup/shellscript_setup
./setup.sh
```

## 5. おわり
すべてうまくインストールできていればYOLOv5のデモがはじまる、はず。  
yolov5_testのディレクトリの中身は6/15にgit cloneでとってきたもの。  
requirements.txtを無効にしたのと、重みを削除した他は特に手を加えていない

# 追加
## 6. DWService（遠隔操作ツール）のセットアップ
https://www.dwservice.net/en/download.html からLinux(Generic)を選択してダウンロード（先にダウンロード先を指定した方がわかりやすい）
ダウンロード先のディレクトリで以下を実行
```
chmod 777 dwagent.sh
sudo ./dwagent.sh

```
アカウントとパスワードはDWServiceに登録しているものを入力する。（その都度、確認してください！）


## 7. 自動ログインの設定
DesktopでSystem Settingsを開き、User AccountのAutomatic LoginをONにする



# 注意点
* ぜんぶで1時間くらいかかるので覚悟すること
* scipyのインストールにとても時間がかかるが、不安にならないこと

# todo
* スクリーンセーバー無効化のスクリプト
* 自動アップデート無効化のスクリプト
* ログイン自動化のスクリプト
* DWService のクライアントのインストールのスクリプト
