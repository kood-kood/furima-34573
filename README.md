# テーブル設計

## usersテーブル

Things you may want to cover:
| Column     | Type     | Options     |
| ---------  | -------- | ----------- |
| email      | string   | null: false |
| password   | string   | null: false |
| nickname   | string   | null: false |
| name       | string   | null: false |
| Birthday   | datetime | null: false |

### Association
- has_many :items
- has_one :orders

## itemsテーブル

* Database initialization
| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| Product name | string   | null: false |
| Category     | string   | null: false |
| price        | integer  | null: false |
| Seller       | string   | null: false |

| image | Implemented with Active Storage | 

### Association
- has_many :users
- has_one :orders

## ordersテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| buy       | text       | null: false |
| payment   | references | null: false |

### Association
- belongs_to :users
- belongs_to :items
- has_one :domiciles

## domicilesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| Street address   | text       | null: false |
| Delivery method  | text       | null: false |

## Association
- belongs_to :orders