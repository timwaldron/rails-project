Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'games#index'
  get "/games", to: "games#index", as: "games"
  get "/games/:id", to: "games#show", as: "show_game"
  post "/games", to: "games#create"
  get "/games/new", to: "games#new", as: "new_game"
end
