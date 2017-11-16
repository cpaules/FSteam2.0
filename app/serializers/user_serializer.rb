class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :money

  has_many :ratings
  has_many :games, through: :ratings
  has_many :comments
end
