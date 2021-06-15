# やること一覧
## 1. JetPack4.5.1のダウンロード
こちらからJetPack4.5.1のイメージをダウンロードして解凍する。  
https://developer.nvidia.com/embedded/jetpack

なお、1~3の手順はnvidia公式の手順がもっとも正確なため、こちらも参照すること。  
https://developer.nvidia.com/embedded/learn/get-started-jetson-xavier-nx-devkit#write
## 2. OSイメージの書き込み
まず、以下のSD Card Formatterというツールを使ってSDカードをフォーマットしておく。  
https://www.sdcard.org/downloads/formatter_4/eula_windows/

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
cd jetson_setup/shellscript
./setup.sh
```

## 5. おわり
すべてうまくインストールできていればYOLOv5のデモがはじまる、はず。  
yolov5_testのディレクトリの中身は6/15にgit cloneでとってきたもの。  
requirements.txtを無効にしたのと、重みを削除した他は特に手を加えていない

# 注意点
* ぜんぶで1時間くらいかかるので覚悟すること
* scipyのインストールにとても時間がかかるが、不安にならないこと

# todo
* スクリーンセーバー無効化のスクリプト
* 自動アップデート無効化のスクリプト
