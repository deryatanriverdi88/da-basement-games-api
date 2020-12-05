class AddColumnToBinder < ActiveRecord::Migration[6.0]
  def change
    add_column :binders, :private, :boolean
  end
end
