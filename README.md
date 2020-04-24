# README

# アプリ名

グループチャット(実装途中)

# 概要

例えば、学校のクラスとかで先生が生徒に連絡あるとき先生からのチャット(お知らせ)はできるけど生徒からのチャットはできないようにしたいなと思って作成しました。目的としてはチャットの荒れやお知らせの埋もれをなくすためです。チャット自体にはコメントって形でチャットを残せます。


# DB設計


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|password|string|null: false|
|email|string|null: false|
|name|string|null: false|
### Association
- has_many :users_groups
- has_many :messages
- has_many :groups,through: :groups_users


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :messages
- has_many :users_groups
- has_many :users,through: :groups_users

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## chatsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|group_id|integer|
|image|string|
|content|string|
### Association
- belongs_to :group

## commentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|image|string|
|content|string|
|chat_id|integer|
### Association
- belongs_to :user
- belongs_to :chat


## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|chat_id|integer|
### Association
- belongs_to :user
- belongs_to :chat


# 実装予定

・いいね機能

・通知機能

・編集

・アプリとしてのビューを整える

