# アクチュアリーのためのR計算環境が一発で整うDockerイメージ
- アクチュアリーがRで分析作業を行うときに一発で必要なパッケージを全て揃えた計算環境を整えることのできるDockerfileです。
- パッケージは、SOAの試験Exam PAのシラバスを参考に選定しました。
- Dockerfileの元は、`rockerjp/verse`です。ggplot2の軸の名前とかをつけるときに日本語でも文字化けしないように設定されているので、文字化けに悩まされることはないと思います。
- html出力だけではなくPDF出力も対応するようにしました。PDF出力したい場合は、Rmdファイルにおいて最初に入力するヘッダー(メタ情報)を以下のようにしてください。
```
---
documentclass: ltjsarticle
output:
  pdf_document:
    latex_engine: lualatex
    number_section: TRUE
---
```

## 使い方(Windows10の場合)
- Windows 10 Proの場合は、Docker for Windows、Windows 10 Homeの場合は、Docker Toolboxをインストール
- (以降の手順を教えてください。。。)
- (Dockerコマンドを使えるようになった後は、macの場合と同じコマンドで使えるはず。)

## 使い方(macの場合)
- Docker for Macをインストール
- Dockerを立ち上げる(上部ツールバーにクジラアイコンが出てきて、Docker Desktop RunningとなっていればOK)
- ターミナルで、以下を入力し通ることを確認
    - `docker --version`
- 普段ドキュメントなどを保存している`<任意のフォルダ>`に移動v
    - `cd <任意のフォルダのパス>`
- 　DockerFileを含むフォルダをgit cloneでダウンロード
    - `git clone git@github.com:kotaro0220/actuaryR.git`
        - `<任意のフォルダ>`に`actuaryR`というフォルダごと保存される
- `actuaryR`フォルダに移動
    -  `cd actuaryR`
- `actuaryR`内のDockerfileをビルドし、`actuaryr`という名前のDockerイメージを作成する
    - `docker build -t actuaryr .`
-  以下のコマンドで、`actuaryr`というDockerイメージが作成されていることを確認する
    - `docker image ls`
- R分析用に色々ファイルやcsvファイルなどを保存したいフォルダを任意の場所に作成する(このフォルダを`<分析用フォルダ>`と呼ぶことにする)
- `actuaryr`というDockerイメージから、コンテナを作成する
    - `docker create -e PASSWORD=<任意のパスワード> -p 8787:8787 -v <分析用フォルダのパス>:/home/rstudio/ actuaryr`
- 以下のコマンドで、`actuaryr`のDockerイメージから、適当な文字列の名前`<CONTAINER ID>`のコンテナが作成されていることを確認する
    - `docker ps -a`
- `<CONTAINER ID>`のコンテナを起動する
    - `docker start <CONTAINER ID>の最初の3文字`
- 普段使っているWebブラウザを立ち上げ、`localhost:8787`にアクセスする。IDとpasswordを聞かれるので、以下の通り入力
    - ID: rstudio
    - password: 上で設定した`<任意のパスワード>`
- これでRstudioが立ち上がるので、任意の分析作業を行う。
    - どこかでダウンロードしたcsvファイルなどを使いたい場合は、`<分析用フォルダ>`に保存すれば、Rstudio上では`/home/rstudio/`に反映される。
    - Rstudioで`/home/rstudio/`に保存したファイルは、`<分析用フォルダ>`にも反映される。
- 分析作業を終わらせたい場合は、Rstudioの右上のオレンジボタンでセッションを完了させた上で、ターミナルで以下の通り入力
    - `docker stop <CONTAINER ID>の最初の3文字`
- 後日、同じフォルダでRstudioを立ち上げて分析作業の続きを行いたい場合は、ターミナルで以下の通り入力。(ターミナルのコマンドを実行する際のカレントディレクトリはどこでも良い)
    - `docker start <CONTAINER ID>の最初の3文字`