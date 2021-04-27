Rails.application.routes.draw do
  devise_for :users
  root :to => "homes#index"
  get 'homes/about'
  resources:users
  resources:books
end
