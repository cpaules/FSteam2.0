class GamesController < ApplicationController

  before_action :set_game, only: [:show, :edit, :update, :add]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to "/games/#{@game.id}"
    else
      redirect_to new_game_path
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @game}
    end
  end

  def add
    if current_user.purchase_game(@game) == true
      flash[:notice] = "Thank you for purchasing #{@game.name}!"
    else
      flash[:notice] = current_user.purchase_game(@game)
    end
      redirect_to user_path(current_user)
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :price, :tag_ids=>[], tags_attributes: [:name])
    end

end
