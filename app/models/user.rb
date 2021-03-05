class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name
    validates :given_names
    validates :last_name_furigana
    validates :given_names_furigana
  end

  with_options presence: true do
    validates :password,format:{with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}+\z/}
    validates :last_name,:given_names,format:{with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :last_name_furigana,:given_names_furigana,format:{with: /\A[ァ-ヶー]+\z/}
  end  

  include ActiveHash::Associations
  has_many :listings

  with_options presence: true do
    validates :category
    validates :product_condition
    validates :shipping_charge
    validates :shipping_area
    validates :days_to_ship
  end

  validates :listing_id, numericality: { other_than: 1 }

end
