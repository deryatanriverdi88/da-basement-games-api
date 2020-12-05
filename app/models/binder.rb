class Binder < ApplicationRecord
  belongs_to :user
  has_many :favorite_cards, dependent: :destroy

  # validates :private, presence: true
  validates :name, uniqueness: true

  def self.alphabetical
    order(:name)
  end
end
