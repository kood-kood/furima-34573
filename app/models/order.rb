class Order < ApplicationRecord

  # include ActiveModel::Model
  # attr_accessor :hoge,:fuga...

  # ここにバリデーションの処理を書く
  validates :user, presence: true
  validates :item, presence: true
  # def save
    # 各テーブルにデータを保存する処理を書く
  # end


  belongs_to :user
  belongs_to :item
  # has_one :domicile

end
