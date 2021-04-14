class Money < ApplicationRecord
  belongs_to :house

  validates :user_name, presence: true
  validates :item_name, presence: true
  validates :price,     presence: true, format: { with: /\A[0-9]+\z/ }
  validates :price,     numericality: true
end
