Rails.application.routes.draw do
  get 'game/new'

  get 'game/game_home'

  get 'game/game_over'

  get 'sessions/new'

  # resources :users
  resources :users #, only: [:edit, :update, :new, :user]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#home'
  get 'sessions/profile'
  get 'sessions/users'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
