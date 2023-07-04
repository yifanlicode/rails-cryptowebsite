Rails.application.routes.draw do

  get 'home/about', to: 'home#about'
  root 'home#index'
end
