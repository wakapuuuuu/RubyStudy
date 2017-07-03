FROM ruby

ENV LANG C.UTF-8

ENV GEMFILE_DIR /usr/src/gem
ENV APP_ROOT /usr/src/RubyStudy


RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs mysql-client&& \
    cp /usr/share/zoneinfo/Japan /etc/localtime &&\
    rm -rf /var/lib/apt/lists/*


RUN mkdir -p $APP_ROOT
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

WORKDIR $APP_ROOT

RUN \
    echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4 && \
    bundle install && \
    rm -rf ~/.gem

# ここから下はrails newした後に追記
