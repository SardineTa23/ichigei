# README

**作成者のtwitterアカウントは[こちら](https://twitter.com/k__rits).**

# Ichigei

サイトへのリンクは [こちら](https://ichigei.work/)!

![image](https://user-images.githubusercontent.com/57013811/85226240-89595c00-b411-11ea-8571-19fdaf7e9b2e.png)
![image](https://user-images.githubusercontent.com/57013811/85226287-b60d7380-b411-11ea-99e9-ed551519caf2.png)


# 概要

自分の特技を仕事にしたい人と、手伝ってほしいことがある人をつなげることのできるサービスです。ユーザーは投稿または求人を作成して、スカウト、メッセージへの返信を待ち当事者同士でやり取りします。現在はサイト内でのポイントで報酬の授受を行い、自分が働けば、ポイントが貯まり求人を作成する際のポイントとして使うことができます。

# 機能
 - アカウント作成、削除
 - ログイン、ログアウト
 - 投稿または求人の作成、編集、削除
 - 投稿または求人へのいいね、ブックマーク（非同期）
 - 投稿または求人へのカテゴリー付与
 - 投稿または求人の検索機能
 - 募集者、参加者のDM機能
 - 投稿へのスカウト機能（非同期）
 - ユーザー同士の相互評価機能
 - 画像表示
 - GoogleMap表示
 - 郵便番号から住所自動入力
 - 所持ポイント機能

# Download(要docker環境)

**ダウンロード後のステップ**

1. Cloneする

```bash
$ git clone https://github.com/k-iwashita/ichigei.git
```

2. ImageMagick インストール(必要に応じて)
macの方
```bash
$ brew install ImageMagick
```
その他
```bash
$ sudo yum install -y ImageMagick ImageMagick-devel
```

3. クローン先へ移動する

```bash
$ cd ichigei
```

4. dockerの立ち上げ

```bash
$ docker-compose build
```

5. migrationとseedを通す

```bash
$ rails db:migrate
$ rails db:seed
```

6. サーバーの立ち上げ

```bash
$ docker-compose up -d
```

7. ローカルホストへ

```bash
$ http://localhost:3000/ へアクセス
```

# 使用した技術
 - Ruby 2.5.1 (使用言語)
 - ruby on rails 5.2.4 (フレームワーク)
 - HTML (デザイン)
 - CSS (デザイン)
 - erb (デザイン)
 - Rspec (テスト)
 - Ajax（非同期通信）
 - MySQL (DB)
 - docker (仮想環境)
 - docker-compose (仮想環境)
 - EC2 (サーバー)
 - RDS (DBサーバー)
 - S3 (画像の保存先)
 - Route53 (ドメイン、IPアドレスの設定)
 - VPC
 - IAM
 - nginx
 - Certbot (https通信のため)
 - GCP(google map API) (Google mapの表示)


# 次の目標

- [ ○ ] 通信のhttps化
- [ ] 自動デプロイ
- [ ] テストの充実
- [ ] 画像の複数枚投稿
- [ ] 管理者機能
- [ ] カテゴリーの作成（管理者）
- [ ] カテゴリーの階層化
- [ ] メッセージの完全自動化
- [ ] Vue.jsを使ったフロントコーディング
- [ ] スマホの画面への対応
- [ ] twitter, googleアカウントでのログイン 
- [ ] エラーメッセージの完全日本語化

# コメント等

プルリクエストなどを使ってご自由に評価してください。

