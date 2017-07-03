#!/bin/bash

docker run --rm -v "$PWD":/usr/src/RubyStudy -w /usr/src/RubyStudy ruby bundle init
echo "gem \"rails\"" >> Gemfile
touch Gemfile.lock

docker-compose build web

docker-compose run web  rails new . -f --database=mysql

echo "COPY . \$APP_ROOT" >> Dockerfile
echo "EXPOSE  3000" >> Dockerfile
echo "CMD [\"rails\", \"server\", \"-b\", \"0.0.0.0\"]"  >> Dockerfile

docker-compose up -d
