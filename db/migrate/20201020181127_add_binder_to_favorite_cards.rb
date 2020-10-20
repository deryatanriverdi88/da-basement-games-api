class AddBinderToFavoriteCards < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_cards, :binder, :string
  end
end
