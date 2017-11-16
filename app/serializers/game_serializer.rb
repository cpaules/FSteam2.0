class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  
  has_many :ratings
  has_many :users, through: :ratings

  has_many :game_tags
  has_many :tags, through: :game_tags
end
