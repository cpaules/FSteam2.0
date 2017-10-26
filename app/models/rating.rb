class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :game

  validates :rating_value, numericality: true, allow_nil: true

  
end
