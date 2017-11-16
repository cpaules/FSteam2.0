class GameTagSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :game
  belongs_to :tag
end
