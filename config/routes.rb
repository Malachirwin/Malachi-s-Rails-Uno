Rails.application.routes.draw do
  resources :users
  get 'user/new'
  get 'user/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
