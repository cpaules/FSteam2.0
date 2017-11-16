class RatingSerializer < ActiveModel::Serializer
  attributes :id, :rating_value, :comment
end
