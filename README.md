


# ManagetAppについて

## コンセプト

* Railsチュートリアル、ポテパンキャンプ、「RspecによるRailsテスト入門」で学んだ知識を定着させるために制作
* このアプリは営業支援ツールとして、顧客管理情報を効率よく管理できるように作成。

## 制作のきっかけ

* 以前勤めていた会社で、似たような機能をJavaで改修した機会があり、Railsで実装するとどうなるかを試したかった。
* これまで学習した書籍や教材のアウトプットの場として、知識の定着を図るために作成。

## 重視した点

* RSpecを用いてテストを記述
* Deviseの使用
* DBにPostgreSQL(本番環境)を使用
* ユーザー画像をアップロードできるようにcarrierwaveを使用
* 検索機能の実装
* レビュー機能の実装
* 管理者画面の作成
* ゲストログイン機能の実装

## 技術スタック
* 言語: Ruby2.6.3
* フレームワーク:Ruby on Rails6.0.4
* DB:SQLite (開発環境), PostgreSQL (本番環境)
* バージョン管理:Git
* インフラ:Heroku

## ER図

https://user-images.githubusercontent.com/79389376/126315042-202c9307-9be9-456e-aa88-f0cd1135a6a6.png

## 実装した機能等の概要
* ログイン機能
* ユーザー情報登録機能
* ユーザー一覧表示機能
* 画像アップロード機能
* 会社情報表示機能
* 詳細表示機能
* 会社情報編集機能
* 会社情報削除機能
* ページネーション機能
* レビュー機能
* DBテーブルのリレーション機能
* 単体テスト、統合テスト(rspecを使用)


