class Chat < ApplicationRecord
  belongs_to :house
  has_one_attached :image
  
  validates :user_name, presence: true
  validates :talk,      presence: true
end
