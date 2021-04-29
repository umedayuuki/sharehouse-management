class Chat < ApplicationRecord
  belongs_to :house
  has_one_attached :image

  with_options presence: true do
    validates :user_name
    validates :talk
  end
end
