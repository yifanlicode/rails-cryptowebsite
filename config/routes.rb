Rails.application.routes.draw do

  resources :cryptocurrencies
  resources :users
  resources :sessions


  get 'home/about', to: 'home#about'
  root 'home#index'
end
