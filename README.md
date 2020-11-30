# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| gender             | integer | null: false |
| encrypted_password | string  | null: false |

### Association

- has_many :user_recodrs

## user_recodrs テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| date        | date       | null: false       |
| food_name   | string     | null: false       |
| kcal        | integer    | null: false       |
| g           | integer    |                   |
| user        | references | foreign_key: true |

### Association

- belongs_to :user

## foods テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| food_name | string  | null: false |
| kcal      | integer | null: false |
| g         | integer |             |
