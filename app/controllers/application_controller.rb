class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def home
    @games = Game.all
    @highest_rated_game = Game.highest_rated
    @tags = Tag.all
  end

end
