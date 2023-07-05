class CryptocurrenciesController < ApplicationController


  # GET /cryptocurrencies
  def index

    @cryptocurrencies = Cryptocurrency.all
  end

  # GET /cryptocurrencies/:id
  def show
  end












end