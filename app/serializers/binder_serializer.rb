class BinderSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_many :favorite_cards
end
