module GamesHelper
  def purchase_game_link(game)
    if current_user
      if !current_user.games.include?(game)
        button_to 'Purchase Game', add_game_path(game)
      else
        "Already Purchased!"
      end
    end
  end

  def show_highest_rated(highest_rated)
    if highest_rated
      "The highest rated game is #{highest_rated}, with a rating of #{highest_rated.avg_rating}!"
    else
      "No games have been rated!"
    end
  end
end
