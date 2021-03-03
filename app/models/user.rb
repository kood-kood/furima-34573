class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,              presence: true
  validates :encrypted_password, presence: true
  validates :nickname,           presence: true
  validates :birthday,           presence: true
  validates :last_name,          presence: true
  validates :given_names,        presence: true
  validates :last_name_furigana, presence: true
  validates :given_names_furigana, presence: true
end
