class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show  #TODO: add foreign keys(user id of user who posted the comment) to comments table
    @comments = @user.comments
    if @comments == nil
      @comments = @user.comments.build
    end
  end

  def game_show #show game and your rating/review of the game
    @game = Game.find(params[:id])
    @rating = Rating.find_by(:user_id => current_user.id, :game_id => @game.id)
  end

  def add_funds
    @user = User.find(params[:user_id])
  end

  def update
    if user_params["money"].class != Float
      @user.errors.add(:money, "Not valid")
      render :show
    else
      @user.money += user_params["money"].to_f
	    @user.save
      redirect_to user_path(@user)
    end
  end

  def index
    @users = User.all
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:password, :admin, :money, comments_attributes: [:comment])
  end
end
