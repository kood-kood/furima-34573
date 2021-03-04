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
  validates :password,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :last_name,:given_names,format:{with: /[ぁ-んァ-ヶ一-龥々]/}
  validates :last_name_furigana,:given_names_furigana,format:{with: /[ァ-ヶー]/}
  end
end

# validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
