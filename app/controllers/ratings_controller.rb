class RatingsController < ApplicationController
  before_action :set_game_edit, only: [:edit]
  before_action :set_game_update, only: [:update]
  before_action :set_rating, only: [:edit, :update]


  def edit
  end

  def update
    if @rating.update(rating_params)
      redirect_to user_game_path(current_user, @game)
    else
      render :edit
    end
  end

  private

  def set_rating
    #binding.pry
    @rating = Rating.find_by(:user_id => current_user.id, :game_id => @game.id)
  end

  def set_game_edit
    @game = Game.find(params[:id])
  end

  def set_game_update
    @game = Game.find(params[:game_id])
  end


  def rating_params
    params.require(:rating).permit(:user_id, :game_id, :rating_value, :comment)
  end

end
