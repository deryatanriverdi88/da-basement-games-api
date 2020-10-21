class Binder < ApplicationRecord
  belongs_to :user
  has_many :favorite_cards
end
