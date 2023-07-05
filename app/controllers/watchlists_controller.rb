class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
  end

  def show
    @watchlist = Watchlist.find_by(cryptocurrency_id: @cryptocurrency.id)
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = Watchlist.new(watchlist_params)
    if @watchlist.save
      redirect_to @watchlist
    else
      render 'new'
    end
  end

  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    redirect_to watchlists_path, notice: "Coin removed from watchlist successfully."
    end

  private

end