class Schedule < ApplicationRecord
  belongs_to :house

  validates :user_name,  presence: true
  validates :start_time, presence: true
  validates :event,      presence: true
end
