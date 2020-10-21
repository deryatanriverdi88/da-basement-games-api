class FavoriteCardSerializer < ActiveModel::Serializer
  attributes :id, :amount, :foil, :normal, :name, :img_url, :category_id, :product_id, :group_id, :rarity, :sub_type, :text, :group_name, :normal_low_price , :normal_mid_price, :normal_high_price, :normal_market_price, :foil_low_price, :foil_mid_price, :foil_high_price,:foil_market_price

  belongs_to :user
  belongs_to :binder
end
