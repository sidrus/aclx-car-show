Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :vehicles
  resources :car_shows
  resources :participants
  resources :entries

  root 'car_shows#index'
end
