class User < ApplicationRecord
  has_many  :chats
  has_many  :rules
  has_many  :moneys
  has_many  :works
  has_many  :schedules
  has_many  :todos
  has_one_attached :image
  belongs_to :house

  validates :user_name, presence: true
  validates :birthday,  presence: true
  validates :image,     presence: true
end
