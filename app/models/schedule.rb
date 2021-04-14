class Schedule < ApplicationRecord
  belongs_to :house

  validates :user_name, presence: true
  validates :day,       presence: true
  validates :event,     presence: true
end
