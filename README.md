# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | data   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| image                      | string     | null: false                    |
| name                       | string     | null: false                    |
| description                | text       | null: false                    |
| category_id                | integer    | null: false                    |
| state_id                   | integer    | null: false                    |
| delivery_charge_burden_id  | integer    | null: false                    |
| delivery_source_area_id    | integer    | null: false                    |
| delivery_days_id           | integer    | null: false                    |
| price                      | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |
| purchase_id                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :comments

## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postcode          | varchar    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | varchar    | null: false                    |
| block             | varchar    | null: false                    |
| building          | varchar    |                                |
| phone_number      | varchar    | null: false                    |
| user_id           | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype