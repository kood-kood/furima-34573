class OrderDomicile
  include ActiveModel::Model
  attr_accessor :token

  attr_accessor :address
  attr_accessor :phone_number
  attr_accessor :postal_code
  attr_accessor :shipping_area_id
  attr_accessor :municipality
  attr_accessor :building_name

  attr_accessor :user_id
  attr_accessor :item_id

  # ここにバリデーションの処理を書く
  validates :token, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_area_id, presence: true
  validates :municipality, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
   order = Order.create(user_id: user_id, item_id: item_id)
    Domicile.create(address: address, phone_number: phone_number, postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, order_id: order.id)
  end
end