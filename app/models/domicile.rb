class Domicile < ApplicationRecord

  validates :address_id, presence: true
  validates :phone_number_id, presence: true
  validates :postal_code_id, presence: true
  validates :shipping_area_id, presence: true
  validates :municipality_id, presence: true

  belongs_to :order
end
