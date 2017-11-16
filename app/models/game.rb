class Game < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings

  has_many :game_tags
  has_many :tags, through: :game_tags

  validates_presence_of :name, :price
  validates_uniqueness_of :name
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  # def tags_attributes=(tag_attributes)
  #   tag_attributes.values.each do |tag_attribute|
  #     tag = Tag.find_or_create_by(tag_attribute)
  #     self.tags << tag
  #   end
  # end

  def self.highest_rated
    best_rating = 0
    best_game = nil

    Rating.all.each do |rating|
      if rating.rating_value && rating.rating_value > best_rating
        best_rating = rating.rating_value
        best_game = Game.find_by(:id => rating.game_id)
      end
    end
    best_game
  end

  def avg_rating
    av_rating = 0.0
    nil_ratings_count = 0
    self.ratings.each do |rating|
      if rating.rating_value != nil
        av_rating += rating.rating_value
      else
        nil_ratings_count += 1
      end
    end
    non_nil_ratings_size = self.ratings.size - nil_ratings_count
    av_rating /= non_nil_ratings_size
  end
end
