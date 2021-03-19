class Classification < ApplicationRecord

  has_many :items
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
end
