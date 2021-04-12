class Rule < ApplicationRecord
  belongs_to :house

  validates :user_name, presence: true
  validates :title,   presence: true
  validates :content, presence: true
end
