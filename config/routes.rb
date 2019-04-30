Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'games/:id', to: 'games#show', as: 'show_game'
  patch 'games/:id', to: 'games#update', as: 'update_game'
  get 'games/:id/edit', to: 'games#edit', as: 'edit_game'

  root 'games#index'
end