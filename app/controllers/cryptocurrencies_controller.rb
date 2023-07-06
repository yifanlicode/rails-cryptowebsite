class CryptocurrenciesController < ApplicationController


  # GET /cryptocurrencies
  def index
    @cryptocurrencies = Cryptocurrency.all
    @watchlist = current_user.watchlists.first if user_signed_in?
  end

  # GET /cryptocurrencies/:id
  def show
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @sparkline_data = JSON.parse(@cryptocurrency.sparkline)  
  end


end