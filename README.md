# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_name          | string     | null: false                    |
| birthday           | date       | null: false                    |
| house              | references | null: false, foreign_key: true |

### Association

- has_many :money
- has_many :works
- has_many :schedules
- belong_to :house

## houses テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| house_name         | string | null: false, unique: true |
| address            | string | null: false               |
| encrypted_password | string | null: false               |

### Association

- has_many :users
- has_one : rule

## rules テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| house   | references | null: false, foreign_key: true |

### Association

- belong_to :house

## money テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## todo テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| todo_name | string     | null: false                    |
| limit     | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## works テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| work_name | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## schedules テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| day    | string     | null: false                    |
| event  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
