class Item < ApplicationRecord

  belongs_to :user 
  belongs_to :listing
  has_one_attached :image    #imageカラムの保存を許可
  
end
