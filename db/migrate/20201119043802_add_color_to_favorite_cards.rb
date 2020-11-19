class AddColorToFavoriteCards < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_cards, :color, :string
  end
end
