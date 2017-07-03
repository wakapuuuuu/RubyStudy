# README

Docker上にmysqlを利用したRuby on　Rails環境を構築するためのファイル・スクリプト

RubyStudy/  
  ├Dockerfile …webサーバのDockerイメージを生成するためのファイル  
  ├docker-compose.yml …dbサーバ・webサーバのDockerコンテナ構成を記載
　└start.sh　…上記2ファイルを元に開発環境を構築

使い方  
* gitクローンを作成してstart.shを実行
* ソースコードと、イメージ・コンテナが生成、起動される。

注意点  
* rubyやmysqlのバージョンの指定をしていないので、最新バージョンとなる
* Dockerfileに最初からCMD等を書くとエラーが出たので（原因未追究）、rails　newしてから追記している。（詳細はstart.sh、Dockerfileに記載）
* rails newをした後に、ソースを追加してイメージをbuildし直しているため、余計なイメージが１件できてしまう（詳細はstart.shに記載）
