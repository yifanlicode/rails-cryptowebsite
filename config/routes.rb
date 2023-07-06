Rails.application.routes.draw do

  devise_for :users
  resources :cryptocurrencies

  post '/cryptocurrencies/:id/add_to_watchlist', to: 'cryptocurrencies_watchlist#add_to_watchlist', as: 'add_to_watchlist'
  delete '/cryptocurrencies/:id/remove_from_watchlist', to: 'cryptocurrencies_watchlist#remove_from_watchlist', as: 'remove_from_watchlist'
  
  resources :cryptocurrencies_watchlist, only: [:index, :show]
  
  resources :watchlists

  get 'home/about', to: 'home#about'
  root 'home#index'
end
