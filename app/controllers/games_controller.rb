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

  def add #todo need to subtract money from user
    if current_user.games.include?(@game)
      redirect_to '/games'
    else
      current_user.games << @game
      redirect_to root_path
    end

  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :price)
    end

end
