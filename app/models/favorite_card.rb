class FavoriteCard < ApplicationRecord
    belongs_to :user
    belongs_to :binder, optional: true
    
    validates :amount, presence: true
    validates :amount, numericality: {other_than: 0}
    validates :user, presence: true

    def self.default_order
        order('id ASC')
    end

    def self.alphabetical
        order(:name)
    end
end
