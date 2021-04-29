class Rule < ApplicationRecord
  belongs_to :house

  with_options presence: true do
    validates :user_name
    validates :title
    validates :content
  end
end
