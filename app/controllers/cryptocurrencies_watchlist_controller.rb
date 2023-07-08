class CryptocurrenciesWatchlistController < ApplicationController
  before_action :authenticate_user!

  def index
      if params[:keyword].present?
        redirect_to cryptocurrencies_path(keyword: params[:keyword])
      end
    @watchlist = current_user.watchlists.first if user_signed_in?
  end

  def add_to_watchlist
    @cryptocurrency = Cryptocurrency.find(params[:id])

    @watchlist = current_user.watchlists.first || current_user.watchlists.create(name: 'Default')

    unless @watchlist.cryptocurrencies.include?(@cryptocurrency)
      @watchlist.cryptocurrencies << @cryptocurrency
      flash[:notice] = "#{@cryptocurrency.name} has been added to your watchlist."
    else
      flash[:alert] = "#{@cryptocurrency.name} is already in your watchlist."
    end

    redirect_to cryptocurrencies_path
  end

  def remove_from_watchlist
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @watchlist = current_user.watchlists.first

    if @watchlist.cryptocurrencies.include?(@cryptocurrency)
      @watchlist.cryptocurrencies.delete(@cryptocurrency)
      flash[:notice] = "#{@cryptocurrency.name} has been removed from your watchlist."
    else
      flash[:alert] = "#{@cryptocurrency.name} is not in your watchlist."
    end

    redirect_to cryptocurrencies_path
  end
end
