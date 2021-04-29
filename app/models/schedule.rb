class Schedule < ApplicationRecord
  belongs_to :house

  with_options presence: true do
    validates :user_name
    validates :start_time
    validates :event
  end
end
