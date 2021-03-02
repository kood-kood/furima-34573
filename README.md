# テーブル設計

## usersテーブル

Things you may want to cover:
| Column             | Type     | Options     |
| -----------------  | -------- | ----------- |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
| name               | string   | null: false |
| birthday           | date     | null: false |
| last_name          | string   | null: false |
| given_names        | string   | null: false |
| last_name_furigana | string   | null: false |
| given_names_furigana | string   | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

* Database initialization
| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| product_name | string   | null: false |
| category_id  | integer  | null: false, foreign_key: true |
| price        | integer  | null: false |
| seller_id    | integer  | null: false, foreign_key: true |
| description  | text     | null: false |
| details_id   | integer  | null: false, foreign_key: true |
| delivery_id  | integer  | null: false, foreign_key: true |
| product_name        | text     | null: false |
| description_of_item | text     | null: false |
| product_price       | integer  | null: false |
| product_condition   | text     | null: false |
| shipping_charges    | integer  | null: false |
| shipping_rea        | text     | null: false |
| days_to_ship        | date     | null: false |
| category            | text     | null: false |

### Association
- belongs_to :user
- has_one :order

## historysテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| buy       | text       | null: false, foreign_key: true |
| payment   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :domicile

## domicilesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| street_address   | text       | null: false |
| delivery_method  | text       | null: false |
| phone_number     | text       | null: false |
| postal_code      | string     | null: false |
| prefectures      | string     | null: false |
| municipality     | string     | null: false |
| address          | string     | null: false |
| building_name    | string     | null: false |
| phone_number     | string     | null: false |

## Association
- belongs_to :order

## messagesテーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| comment   | string         |
| user      | references     | null: false, foreign_key: true |
| item      | references     | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

