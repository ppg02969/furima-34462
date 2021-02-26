## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type         | Options                        |
| ---------------  | ------------ | ------------------------------ |
| item_name        | string       | null: false                    |
| item_description | text         | null: false                    |
| category         | string       | null: false                    |
| item_status      | string       | null: false                    |
| shipping_fee     | string       | null: false                    |
| area             | string       | null: false                    |
| delivery_days    | integer      | null: false                    |
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
| poster_code      | integer      | null: false                    |
| prefectures      | string       | null: false                    |
| municipality     | string       | null: false                    |
| address          | integer      | null: false                    |
| phone_number     | integer      | null: false                    |
| order            | references   | null: false, foreign_key: true |

### Association

- has_one :buyers
