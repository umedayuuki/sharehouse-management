# シェアハウス管理アプリ

## 概要
シェアハウスを登録しログインすることで住民登録を可能とし、  
生活ルール設定、金銭管理、家事分担機能、TODOリスト、スケジュール管理が利用できる。  

## 制作背景
最近では友達同士でシェアハウスをするといったことも増えてきています。  
TODOリストやチャット機能、家計簿などのアプリは存在しますが分けて使用しなければならない煩わしさがあると感じました。  
そこでシェアハウスを快適にする為に必要な機能を搭載したアプリの制作を行いました。  

## 機能についての画像及びGIFでの説明

## 要件定義
今後の実装予定をスプレッドシートにまとめました。  
https://docs.google.com/spreadsheets/d/1WBduySmRhI-xivZSVaQRaqVBq4r9shkxDwQhH1DSRYg/edit#gid=282075926

## データーベース設計
ER図  

# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_name          | string     | null: false                    |
| birthday           | date       | null: false                    |
| house              | references | null: false, foreign_key: true |

### Association

- has_many  :chats
- has_many  :rules
- has_many  :moneys
- has_many  :works
- has_many  :schedules
- has_many  :todos
- belongs_to :house

## houses テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| house_name         | string | null: false, unique: true |
| address            | string | null: false               |
| encrypted_password | string | null: false               |

### Association

- has_many :users
- has_many :chats
- has_many :rules
- has_many :moneys
- has_many :works
- has_many :schedules
- has_many :todos

## rules テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| house   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :house

## moneys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :house

## todos テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| todo_name | string     | null: false                    |
| limit     | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :house

## works テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| work_name | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :house

## schedules テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| day    | string     | null: false                    |
| event  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| house  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :house

## chats テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| house  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :house