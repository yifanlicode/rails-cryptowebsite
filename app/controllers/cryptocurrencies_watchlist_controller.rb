class CryptocurrenciesWatchlistController < ApplicationController
  before_action :authenticate_user!

  def index
      if params[:keyword].present?
        redirect_to cryptocurrencies_path(keyword: params[:keyword])
      end

    @watchlist = current_user.watchlists.find(params[:id]) if user_signed_in?
  end

  def add_to_watchlist
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @user = current_user
    @watchlists = @user.watchlists
  
    # Find the selected watchlist by its ID
    selected_watchlist = @watchlists.find(params[:watchlist_id])
  
    if selected_watchlist.cryptocurrencies.include?(@cryptocurrency)
      flash[:alert] = "#{selected_watchlist.name} already includes #{@cryptocurrency}"
    else
      selected_watchlist.cryptocurrencies << @cryptocurrency
      flash[:notice] = "#{@cryptocurrency.symbol} has been added to #{selected_watchlist.name}"
    end
  
    redirect_to cryptocurrencies_path
  end
  

  def remove_from_watchlist
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @watchlists = current_user.watchlists
  
    @watchlists.each do |watchlist|
      if watchlist.cryptocurrencies.include?(@cryptocurrency)
        watchlist.cryptocurrencies.delete(@cryptocurrency)
      end
    end
  
    flash[:notice] = "#{@cryptocurrency.symbol} has been removed from your watchlists."
    redirect_to cryptocurrencies_watchlist_path
  end
  
end
