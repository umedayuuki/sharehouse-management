class User < ApplicationRecord
    has_one_attached :image
    belongs_to :house

    validates :user_name, presence: true

end
