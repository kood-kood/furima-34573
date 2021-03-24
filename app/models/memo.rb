class Memo < ApplicationRecord

  has_many :users

  validates :memo, presence: true

end
