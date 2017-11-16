class RatingSerializer < ActiveModel::Serializer
  attributes :id, :rating_value, :comment

  belongs_to :user
  belongs_to :game
end
