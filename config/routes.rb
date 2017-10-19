Rails.application.routes.draw do
  resources :ratings
  resources :games
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users/:id' => 'users#show', as: 'user'
  post '/games/:id/add' => 'games#add', as: 'add_game'
  get '/users/:user_id/games/:id' => 'users#game_show', as: 'user_game'
  get '/users/:user_id/games/:id/edit' => 'ratings#edit', as: 'user_rating'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'

end
