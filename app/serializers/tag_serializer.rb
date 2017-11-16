class TagSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :game_tags
  has_many :games, through: :game_tags
end
