class Binder < ApplicationRecord
  belongs_to :user
  has_many :favorite_cards, dependent: :destroy
end
