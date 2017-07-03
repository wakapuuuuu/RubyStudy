#!/bin/bash

# Gemfileを生成するため、rubyイメージでbundle initを実行
docker run --rm -v "$PWD":/usr/src/RubyStudy -w /usr/src/RubyStudy ruby bundle init
# railsのgemを追加、空のGemfile.lockを生成
echo "gem \"rails\"" >> Gemfile
touch Gemfile.lock

# 一度イメージをビルド（※）し、rails newをしてプロジェクトを生成
docker-compose build web
docker-compose run web  rails new . -f --database=mysql

# Dockerfileに設定を追加
echo "COPY . \$APP_ROOT" >> Dockerfile
echo "EXPOSE  3000" >> Dockerfile
echo "CMD [\"rails\", \"server\", \"-b\", \"0.0.0.0\"]"  >> Dockerfile

# 再度ビルドして実行（（※）でビルドしたイメージがごみとして残ってしまう。。）
docker-compose build
docker-compose up -d
