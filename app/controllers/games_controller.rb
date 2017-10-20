class GamesController < ApplicationController

  before_action :set_game, only: [:show, :edit, :update]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to "/games/#{@game.id}"
    else
      redirect_to "/games/new"
    end
  end

  def show
  end

  def add #TODO
    if current_user.games.include?(@game) #technically shouldnt need this since th button shouldt appear if user already has it
      flash[:notice] = "You already have #{@game.name}!"
    elsif current_user.purchase_game(request.@game) == true
      flash[:notice] = "Thank you for purchasing #{@game.name}!"
    else
      flash[:notice] = current_user.purchase_game(request.@game)
    end
      redirect_to user_path
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :price)
    end

end
