class Todo < ApplicationRecord
  belongs_to :house

  validates :user_name, presence: true
  validates :list, presence: true
  validates :limit, presence: true
end
