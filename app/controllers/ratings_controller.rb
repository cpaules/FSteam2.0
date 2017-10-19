class RatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :update]

  def edit
  end

  def update
    if @rating.update(rating_params)
        redirect_to user_game_path # "/users/#{@rating.user_id}/games/#{@rating.game_id}"
    else
        redirect_to user_rating_path # "/users/#{@rating.user_id}/games/#{@rating.game_id}/edit"
    end
  end

  private

  def set_rating
    @game = Game.find(params[:id])
    @rating = Rating.find_by(:user_id => current_user.id, :game_id => @game.id)
  end

  def rating_params
    params.require(:rating).permit(:user_id, :game_id, :rating_value, :comment)
  end

end
