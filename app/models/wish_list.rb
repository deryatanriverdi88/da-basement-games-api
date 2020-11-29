class WishList < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_card
end
