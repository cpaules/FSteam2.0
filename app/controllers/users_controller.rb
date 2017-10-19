class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def game_show #show game and your rating/review of the game
    #binding.pry
    @game = Game.find(params[:id])
    @rating = Rating.find_by(:user_id => current_user.id, :game_id => @game.id)
  end

end
