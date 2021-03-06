hist# テーブル設計

## usersテーブル

Things you may want to cover:
| Column             | Type     | Options     |
| -----------------  | -------- | ----------- |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
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
| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| product_name         | string   | null: false |
| price                | integer  | null: false |
| description          | text     | null: false |
| product_condition_id | integer  | null: false | 
| shipping_charge_id   | integer  | null: false |
| shipping_area_id     | integer  | null: false |
| days_to_ship_id      | integer  | null: false |
| category_id          | integer  | null: false |

| user_id              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :domicile

## domicilesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| address          | string     | null: false |
| phone_number     | string     | null: false |
| postal_code      | string     | null: false |
| shipping_area_id | integer    | null: false |
| municipality     | string     | null: false |
| building_name    | string     |

| order          | references | null: false, foreign_key: true |

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

