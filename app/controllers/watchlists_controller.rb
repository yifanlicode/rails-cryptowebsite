class WatchlistsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  # show all watchlists
  def index
    @watchlists = current_user.watchlists
    @new_watchlist = Watchlist.new
  end

  # show a single watchlist and its coins
  def show
  end

  # create a new watchlist
  def create
    @watchlist = current_user.watchlists.build(watchlist_params)
    if @watchlist.save
      redirect_to watchlists_path, notice: "Watchlist created successfully."
    else
      # Handle validation errors
      render :index
    end
  end

  # Update the name of a watchlist
  def update
    @watchlist = current_user.watchlists.find(params[:id])

    if @watchlist.update(watchlist_params)
      redirect_to @watchlist, notice: "Watchlist updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @watchlist = current_user.watchlists.find(params[:id])
    @watchlist.destroy
    redirect_to watchlists_path, notice: "Watchlist deleted successfully."
  end

 
 

end
