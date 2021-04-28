class Money < ApplicationRecord

  belongs_to :house

  with_options presence: true do
    validates :user_name
    validates :item_name
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: true
  end
  
end
