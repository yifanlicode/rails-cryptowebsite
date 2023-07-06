class CryptocurrenciesController < ApplicationController
  
  # GET /cryptocurrencies
  def index
    @cryptocurrencies = Cryptocurrency.order('rank ASC').page(params[:page]).per(50)
    @watchlist = current_user.watchlists.first if user_signed_in?
  end

  # GET /cryptocurrencies/:id
  def show
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @sparkline_data = JSON.parse(@cryptocurrency.sparkline)  
  end


end