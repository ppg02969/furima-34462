## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type         | Options                        |
| ---------------  | ------------ | ------------------------------ |
| name             | string       | null: false                    |
| description      | text         | null: false                    |
| category_id      | integer       | null: false                    |
| status_id        | integer      | null: false                    |
| shipping_fee_id  | integer      | null: false                    |
| area_id          | integer      | null: false                    |
| delivery_day_id  | integer      | null: false                    |
| price            | integer      | null: false                    |
| user             | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :orders

## ordersテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| item       | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :buyers

## buyersテーブル

| Column           | Type         | Options                        |
| ---------------  | ------------ | ------------------------------ |
| poster_code      | string       | null: false                    |
| area_id          | integer      | null: false                    |
| municipality     | string       | null: false                    |
| address          | integer      | null: false                    |
| building_name    | string       | null: false                    |
| phone_number     | string       | null: false                    |
| order            | references   | null: false, foreign_key: true |

### Association

- has_one :buyers
