class Order 
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
  validates :phone_number, presence: true
  validates :postal_code, presence: true
  validates :shipping_area_id, presence: true
  validates :municipality, presence: true

  validates :user_id, presence: true
  validates :item_id, presence: true
  
  def save
    
  end


 
  # has_one :domicile

end
