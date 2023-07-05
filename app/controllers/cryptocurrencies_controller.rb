class CryptocurrenciesController < ApplicationController


  # GET /cryptocurrencies
  def index
    @cryptocurrencies = Cryptocurrency.all
  end

  # GET /cryptocurrencies/:id
  def show
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @sparkline_data = JSON.parse(@cryptocurrency.sparkline)  
  end

  private









end