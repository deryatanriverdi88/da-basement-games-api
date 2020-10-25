class AddIconToFavoriteCards < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_cards, :icon, :string
  end
end
