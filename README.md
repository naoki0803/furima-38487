# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | data   | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| description                | text       | null: false                    |
| category_id                | integer    | null: false                    |
| state_id                   | integer    | null: false                    |
| delivery_charge_burden_id  | integer    | null: false                    |
| prefecture_id              | integer    | null: false                    |
| delivery_days_id           | integer    | null: false                    |
| price                      | integer    | null: false                    |
| Seller_id                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| purchaser_id      | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery



## deliveries テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postcode          | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| block             | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| purchase_id      | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase