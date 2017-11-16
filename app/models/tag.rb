class Tag < ApplicationRecord
  has_many :game_tags
  has_many :games, through: :game_tags

  validates_uniqueness_of :name
  validates_presence_of :name

end
