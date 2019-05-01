Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Index
  get "/games", to: "games#index", as: "games"
  
  # Create
  get "/games/new", to: "games#new", as: "new_game"
  post "/games", to: "games#create"

  # Edit/Update
  get "/games/:id", to: "games#show", as: "show_game"
  patch "/games/:id", to: "games#update", as: "update_game"
  get "/games/:id/edit", to: "games#edit", as: "edit_game"
  
  #root
  root "games#index"

  # Delete
  delete "/games/:id", to: "games#destroy", as: "destroy_game"
end