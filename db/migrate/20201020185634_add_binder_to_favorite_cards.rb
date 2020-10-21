class AddBinderToFavoriteCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorite_cards, :binder, null: true, foreign_key: true
  end
end
