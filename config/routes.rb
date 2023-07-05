Rails.application.routes.draw do

  devise_for :users
  resources :cryptocurrencies
  resources :watchlists

  get 'home/about', to: 'home#about'
  root 'home#index'
end
