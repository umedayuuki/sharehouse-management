# シェアハウス管理アプリ

## 概要
シェアハウスを登録しログインすることで住民登録が可能となり、  
登録した住民を選択することでチャット、カレンダー、ルール設定、TODOリスト登録、金銭管理、役割分担の機能が利用できます。  

## 制作背景
最近では友達同士でシェアハウスをする場面が増えてきています。  
実際にアプリ製作者もシェアハウスの経験があり、経験を元にアプリの開発をしました。  
TODOリストやチャット機能、家計簿などのアプリは存在しますがアプリごとに分けて使用しなければならない煩わしさがあると感じました。  
そこでシェアハウスでの生活を快適にする為に必要な機能をひとつに搭載したアプリの制作を行いました。  

## 要件定義
今後の実装予定をスプレッドシートにまとめました。  
https://docs.google.com/spreadsheets/d/1WBduySmRhI-xivZSVaQRaqVBq4r9shkxDwQhH1DSRYg/edit#gid=282075926

## 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code/Bootstrap  

## URL
https://sharehouse-management.herokuapp.com/

## Basic認証
ログイン  
ユーザー名：admin  
パスワード：2222  

## テストアカウント
ログイン  
シェアハウス（名前）：テストハウス  
パスワード（6文字以上）：111111  

## GIFでの機能説明

### シェアハウスの新規登録・ログイン
[![Image from Gyazo](https://i.gyazo.com/0027e189f41307450dfdba1bc69b4c5c.gif)](https://gyazo.com/0027e189f41307450dfdba1bc69b4c5c)
### メニュー画面へ移動
[![Image from Gyazo](https://i.gyazo.com/ba9eb17203bd2b2916b70dc7cb5e5ca3.gif)](https://gyazo.com/ba9eb17203bd2b2916b70dc7cb5e5ca3)
### シェアハウス情報の確認・編集
[![Image from Gyazo](https://i.gyazo.com/74c489a08675e8488ed930dc30e1ddcf.gif)](https://gyazo.com/74c489a08675e8488ed930dc30e1ddcf)
### ルームメイトの登録・表示
[![Image from Gyazo](https://i.gyazo.com/6214d8050415dc12f90cad49a4ec00a8.gif)](https://gyazo.com/6214d8050415dc12f90cad49a4ec00a8)
### チャットの登録・表示
[![Image from Gyazo](https://i.gyazo.com/acd99d95b88e22476451c0efac5e574c.gif)](https://gyazo.com/acd99d95b88e22476451c0efac5e574c)
### スケジュールの登録・表示
[![Image from Gyazo](https://i.gyazo.com/e5d8a67faee314b0c23f86086fcaef71.gif)](https://gyazo.com/e5d8a67faee314b0c23f86086fcaef71)
### ルールの登録・表示
[![Image from Gyazo](https://i.gyazo.com/7132195f9be131194f30a2ab9a3b1f7a.gif)](https://gyazo.com/7132195f9be131194f30a2ab9a3b1f7a)
### TODOの登録・表示
[![Image from Gyazo](https://i.gyazo.com/274fe0357085244d18fbb7f1c7b6e6bc.gif)](https://gyazo.com/274fe0357085244d18fbb7f1c7b6e6bc)
### 支出の登録・表示
[![Image from Gyazo](https://i.gyazo.com/7367dc94a59f821b6244922f0ec5c4d9.gif)](https://gyazo.com/7367dc94a59f821b6244922f0ec5c4d9)
### 役割の登録・表示
[![Image from Gyazo](https://i.gyazo.com/08cc75f077cc11c084bc4550879f6fcc.gif)](https://gyazo.com/08cc75f077cc11c084bc4550879f6fcc)

## DB設計

### ER図
<img width="642" alt="シェアハウスER図" src="https://user-images.githubusercontent.com/74130074/116638404-39d4ac80-a9a1-11eb-9c00-c9dbf77c370e.png">

# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_name          | string     | null: false                    |
| birthday           | date       | null: false                    |
| house              | references | null: false, foreign_key: true |

### Association

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
- has_many :money
- has_many :works
- has_many :schedules
- has_many :todos

## rules テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user_name | string     | null: false                    |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :house

## money テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| price     | integer    | null: false                    |
| user_name | string     | null: false                    |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :house

## todos テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| list      | string     | null: false                    |
| limit     | string     | null: false                    |
| user_name | string     | null: false                    |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :house

## works テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| work_name | string     | null: false                    |
| user_name | string     | null: false                    |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :house

## schedules テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| day       | date       | null: false                    |
| event     | string     | null: false                    |
| user_name | string     | null: false                    |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :house

## chats テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| talk      | string     | null: false                    |
| user_name | string     | null: false                    |
| house     | references | null: false, foreign_key: true |

### Association

- belongs_to :house