class OrderDomicile
  include ActiveModel::Model

  attr_accessor :token, :address, :phone_number, :postal_code, :shipping_area_id, :municipality, :building_name, :user_id, :item_id

  with_options presence: true do
   validates :token
   validates :address, length: { maximum: 10 }
   validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9][\d{10,11}]+\z/ }
   validates :postal_code, length: { maximum: 10 }, format: { with: /\A[0-9][\d{3}[-]\d{4}]+\z/ }
   validates :municipality
   validates :user_id
   validates :item_id
  end

   validates :shipping_area_id, numericality: { other_than: 1 }

  def save
   order = Order.create(user_id: user_id, item_id: item_id)
    Domicile.create(address: address, phone_number: phone_number, postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, order_id: order.id)
  end
end