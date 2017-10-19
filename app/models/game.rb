class Game < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings

  def most_expensive #returns the most expenisve game in users inventory
  end

end
