class CreateWishLists < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_lists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :favorite_card, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
