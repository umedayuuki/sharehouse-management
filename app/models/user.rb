class User < ApplicationRecord
  has_many :chats
  has_many :rules
  has_many :money
  has_many :works
  has_many :schedules
  has_many :todos
  has_one_attached :image
  belongs_to :house

  with_options presence: true do
    validates :user_name
    validates :birthday
    validates :image
  end
end
