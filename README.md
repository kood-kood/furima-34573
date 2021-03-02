# テーブル設計

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
- has_many :histories

## itemsテーブル

* Database initialization
| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| product_name      | string   | null: false |
| price             | integer  | null: false |
| description       | text     | null: false |
| product_condition | text     | null: false | 
| shipping_charges  | integer  | null: false |
| shipping_rea      | text     | null: false |
| days_to_ship      | date     | null: false |
| category_id       | integer  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :historie

## historysテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| buy       | text       | null: false, foreign_key: true |
| payment   | references | null: false, foreign_key: true |

### Association
- belongs_to :user, foreign_key: true
- belongs_to :item, foreign_key: true
- has_one :domicile

## domicilesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| address          | text       | null: false |
| phone_number     | text       | null: false |
| postal_code      | string     | null: false |
| prefectures      | string     | null: false |
| municipality     | string     | null: false |
| building_name    | string     | null: false |

## Association
- belongs_to :history

## messagesテーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| comment   | string         |
| user      | references     | null: false, foreign_key: true |
| item      | references     | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

