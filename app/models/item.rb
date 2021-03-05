class Item < ApplicationRecord

  belongs_to :user 
  has_one_attached :image    #imageカラムの保存を許可

  include ActiveHash::Associations
  belongs_to :listing

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

end
