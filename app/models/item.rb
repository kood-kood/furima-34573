class Item < ApplicationRecord

attr_accessor :keyword

  belongs_to :user
  has_one :order
  has_one_attached :image    # imageカラムの保存を許可
  has_many :messages, dependent: :destroy
  belongs_to :classification

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  belongs_to :category


  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates  :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

 with_options numericality: { other_than: 1 } do
  validates :product_condition_id
  validates :shipping_charge_id
  validates :shipping_area_id
  validates :days_to_ship_id
  validates :category_id
  # ジャンルの選択が「--」の時は保存できないようにする
 end

 def self.search(search)
  if search 
    Item.where(['product_name LIKE ?', "%#{search}%"])
  else
    Item.all
  end
 end

end
