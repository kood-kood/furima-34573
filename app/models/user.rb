class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  # validates :email,              presence: true
  # validates :encrypted_password, presence: true
  validates :nickname,           presence: true
  validates :birthday,           presence: true
  validates :last_name,          presence: true
  validates :given_names,        presence: true
  validates :last_name_furigana, presence: true
  validates :given_names_furigana, presence: true

  with_options presence: true do
  validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :last_name,:given_names,:last_name_furigana,:given_names_furigana,format:{with: /[ぁ-んァ-ヶ一-龥々]/}
  end
end

# validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
