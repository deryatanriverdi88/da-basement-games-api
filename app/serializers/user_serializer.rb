class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :role, :email

  has_many :favorite_cards
end
