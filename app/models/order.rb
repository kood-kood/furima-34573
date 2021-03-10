class Order 
  include ActiveModel::Model

    # ここにバリデーションの処理を書く
  attr_accessor :token
  attr_accessor :address
  attr_accessor :phone_number
  attr_accessor :postal_code
  attr_accessor :shipping_area_id
  attr_accessor :municipality
  attr_accessor :building_name

  attr_accessor :user_id
  attr_accessor :item_id
  
  # validates :token, presence: true

  def save
    
  end


 
  # has_one :domicile

end
