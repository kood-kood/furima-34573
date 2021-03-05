class Item < ApplicationRecord

  belongs_to :user 
  has_one_attached :image    #imageカラムの保存を許可

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  belongs_to :category

  with_options presence: true do
    validates :product_name
    validates :price
    validates :description
    validates :category
    validates :product_condition
    validates :shipping_charge
    validates :shipping_area
    validates :days_to_ship
  end

  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
    #ジャンルの選択が「--」の時は保存できないようにする

end
