class Order 
  include ActiveModel::Model
  attr_accessor :token

  # ここにバリデーションの処理を書く
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
