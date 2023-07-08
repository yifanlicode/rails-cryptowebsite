class WatchlistsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  # show all watchlists
  def index
      if params[:keyword].present?
        redirect_to cryptocurrencies_path(keyword: params[:keyword])
      end
    

    @watchlists = current_user.watchlists
    @new_watchlist = Watchlist.new
    @user = current_user
  end

  def new
    @watchlist = Watchlist.new
  end

  # show all the cryptocurrencies_watchlists for the user
  def show
    @watchlist = current_user.watchlists.find(params[:id])
    @user = current_user
  end

  # create a new watchlist
  def create
    @user = current_user
    @watchlist = @user.watchlists.build(watchlist_params)

    if @watchlist.save
      @watchlists = @user.watchlists # Set @watchlists variable after creating a new watchlist
      redirect_to watchlists_path, notice: 'Watchlist was successfully created.'
    else
      render :new
    end
  end

  def watchlist_params
    params.require(:watchlist).permit(:name)
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
