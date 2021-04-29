class Todo < ApplicationRecord
  belongs_to :house

  with_options presence: true do
    validates :user_name
    validates :list
    validates :limit
  end
end
