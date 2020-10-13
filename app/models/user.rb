class User < ApplicationRecord
    has_many :favorite_cards, dependent: :destroy
    has_secure_password

    validates :email, uniqueness: true
end
