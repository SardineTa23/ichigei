# Railsコンテナ用Dockerfile

# イメージのベースラインにRuby2.5.1を指定
FROM ruby:2.5.1
# Railsに必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential nodejs && apt-get install -y nginx
ADD nginx.conf /etc/nginx/sites-available/app.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf
# ルートディレクトリを作成
RUN mkdir /mimes
# 作業ディレクトリを指定
WORKDIR /mimes
# ローカルのGemfileとGemfile.lockをコピー
COPY ./Gemfile /mimes/Gemfile
COPY ./Gemfile.lock /mimes/Gemfile.lock
# Gemのインストール実行
RUN bundle install
RUN apt-get install -y vim
ADD . /app
RUN mkdir /app/tmp/sockets
# ローカルのsrcをコピー
COPY . /mimes
ENV LANG C.UTF-8　
CMD bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf