
アプリケーション名             furima-34573

アプリケーション概要           ユーザーは新規登録・ログイン・ログアウトが出来ます。
                            出品者は商品を出品でき、購入者は商品を購入できます。
                            出品者は出品した商品情報に対して編集・削除する事ができ、その商品を購入する事が出来ません。
                            購入者は出品された商品を購入する事ができ、その商品の情報を編集、削除する事が出来ません。
                            購入済みの商品は出品者・購入者関係無く、商品情報を編集・削除・購入が出来ません。
                            商品検索する事で商品を絞り込むことが出来ます。
                            出品された商品に対してコメントする事が出来ます。

URL                         https://furima-34573.herokuapp.com/

テスト用アカウント                      メールアドレス    パスワード
                            出品者    test@com        ppp000
                            購入者    test2@com       ooo999

                          Basic認証   ユーザー名       パスワード
                                      admin          2222

利用方法                     新規登録・ログインをする事で利用可能となり、いつでもログアウトでき
                            ます。
                            必要事項を入力する事で出品でき、出品者以外はその商品を購入できます。
                            商品検索する事で商品を絞り込むことが出来ます。
                            出品された商品に対してコメントする事が出来ます。

目指した課題解決               仕事などで忙しい人が簡単で手短に動作を行える様にしました。

洗い出した要件                 | 機能                | 目的                                           | 詳細                                                                 | ストーリー(ユースケース)           |  
                             | ------------------ | --------------------------------------------- | -------------------------------------------------------------------- | ------------------------------ |
                             | キーワード検索機能    | 欲しい商品を見つけやすくするためです                | 出品されている商品の名前に入力したキーワードが入っていればそれらを一覧表示できます | すぐ検索できる様にするトップページの上部にキーワード検索欄を表示します |
                             |コメント機能          |出品者に質問できる様にするためです                   | 文章を入力すると商品詳細ページに表示されます                                | 商品について気になった事を出品者に気軽に質問できる様にします         |
                             | カテゴリー別検索機能  | 欲しい商品を見つけやすくするためです                 | セレクトボックスで選択したジャンルの商品を一覧表示します                      | 全ての商品の中から欲しい物を探すのは手間なので、ジャンル別で表示できる様カテゴリー別に検索できる様にします |
                             | 自動デプロイツール導入 | AWSのサーバーを利用できる様にするためです            | デプロイを自動で行える様にして作業効率を上げます                             | デプロイ時に必要なコマンド操作が1回で済ませられれば、手動デプロイする場合に起こりがちなコマンドの打ち間違い、手順の間違いが発生する可能性が低くなります |

実装した機能についてのGIF       | 機能                 | GIF                                                                      |
                            | ------------------- | ------------------------------------------------------------------------- |
                            | キーワード検索機能     | https://gyazo.com/905beef7ecab2b20e0d6ca6fcb9f55d8                        |
                            | コメント機能          | https://gyazo.com/b4c3a67d6a7a2116bd61bd383a2beba4                        |
                            | カテゴリー別検索機能   | https://gyazo.com/e14335054347c795ccc0fafa397b3a15  （該当する商品がある場合） |
                                                  | https://gyazo.com/e84ac9eda2971c073e44432feafa2a0a  （該当する商品が無い場合） |

実装予定の機能                 | 機能                | 目的                                           | 詳細                                                                 | ストーリー(ユースケース)           |  
                             | ------------------ | --------------------------------------------- | -------------------------------------------------------------------- | ------------------------------ |
                             |  メモ機能            | 気になった事や忘れたくない事をメモできる様にするためです | 咄嗟に思いついたことをすぐメモできる様にします                              | 素早く、手軽にメモできる様にすれば余計な物忘れを防ぐ事ができます |

データベース設計                     ![furima](https://user-images.githubusercontent.com/78333114/112427308-bc53c600-8d7c-11eb-9efd-dcc6061f2569.png)

ローカルでの動作方法            以下の手順を踏んで下さい。
                            １, ターミナルで「git clone https://github.com/kood-kood/furima-34573.git」とコマンドを入力し、GITクローンをします。
                            ２, 「cd furima-34573」とコマンドを打ち、アプリケーションのディレクトリに移動します。
                            ３, 「yarn upgrade」と打つ事で、「yarn.lock」ファイルをアップグレードします。
                            ４, 「rails db:create」・「rails db:migrate」コマンドを打って、データベースを整えます。
                            ５, 「rails s 」コマンドで起動し、ブラウザで「http://localhost:3000/」とURLを入力して表示します。

                            以上です



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
- has_many :searchers
- has_many :messages, dependent: :destroy
- has_many :memos

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
- belongs_to :search
- has_many :messages, dependent: :destroy

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
| comment   | text           | null: false                    |
| user      | references     | null: false, foreign_key: true |
| item      | references     | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## searchersテーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| user      | references     | null: false, foreign_key: true |
| item      | references     | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items


## memosテーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| note      | text           | null: false                    |

### Association
- belongs_to :user
