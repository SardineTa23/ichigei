# Railsコンテナ用Dockerfile

# イメージのベースラインにRuby2.5.1を指定
FROM ruby:2.5.1
# Railsに必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential nodejs
# ルートディレクトリを作成
RUN mkdir /mimes
# 作業ディレクトリを指定
WORKDIR /mimes
# ローカルのGemfileとGemfile.lockをコピー
COPY ./Gemfile /mimes/Gemfile
COPY ./Gemfile.lock /mimes/Gemfile.lock
# Gemのインストール実行
RUN bundle install
# ローカルのsrcをコピー
COPY . /mimes