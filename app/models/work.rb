class Work < ApplicationRecord
  belongs_to :house

  validates :user_name, presence: true
  validates :work_name, presence: true

end
