Rails.application.routes.draw do

  devise_for :users
  resources :cryptocurrencies
  resources :watchlists

  resources :watchlists do
    member do
      post 'add_coin', to: 'watchlists#add_coin'
      delete 'remove_coin', to: 'watchlists#remove_coin'
    end
  end

  delete 'watchlists/:watchlist_id/remove_coin/:cryptocurrency_id', to: 'watchlists#remove_coin', as: 'watchlist_remove_coin'
  post 'watchlists/:watchlist_id/add_coin/:cryptocurrency_id', to: 'watchlists#add_coin', as: 'watchlist_add_coin'


  get 'home/about', to: 'home#about'
  root 'home#index'
end
