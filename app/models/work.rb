class Work < ApplicationRecord
  belongs_to :house

  with_options presence: true do
    validates :user_name
    validates :work_name
  end
end
