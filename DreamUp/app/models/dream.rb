class Dream < ApplicationRecord
    belongs_to :user
    has_many :comments , dependent: :destroy
    has_one_attached :avatar
end
