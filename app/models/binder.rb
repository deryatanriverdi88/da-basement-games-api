class Binder < ApplicationRecord
  belongs_to :user
  has_many :favorite_cards, dependent: :destroy

  validates :private, presence: true

  def self.alphabetical
    order(:name)
  end
end
