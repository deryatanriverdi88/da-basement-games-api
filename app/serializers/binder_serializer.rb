class BinderSerializer < ActiveModel::Serializer
  attributes :id, :name, :private
  has_one :user
  has_many :favorite_cards
end
