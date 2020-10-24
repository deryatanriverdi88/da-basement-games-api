class RemoveNormalFromFavoriteCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorite_cards, :normal, :boolean
  end
end
