class CryptocurrenciesController < ApplicationController
  
  # GET /cryptocurrencies
  # Search for cryptocurrencies by name or symbol
  def index
    keyword = params[:keyword]
    category = params[:category]
  
    if keyword.present?
      case category
      when 'All'
        @cryptocurrencies = Cryptocurrency.where('name LIKE ? OR symbol LIKE ?', "%#{keyword}%", "%#{keyword}%").order('rank ASC').page(params[:page]).per(20)
      when 'Top 100'
        @cryptocurrencies = Cryptocurrency.where('name LIKE ? OR symbol LIKE ?', "%#{keyword}%", "%#{keyword}%").where('rank <= 100').order('rank ASC').page(params[:page]).per(20)
      when 'Potential Tokens'
        @cryptocurrencies = Cryptocurrency.where('name LIKE ? OR symbol LIKE ?', "%#{keyword}%", "%#{keyword}%").where('change > 0').order('rank ASC').page(params[:page]).per(20)
      else
        @cryptocurrencies = Cryptocurrency.order('rank ASC').page(params[:page]).per(50)
      end
    else
      @cryptocurrencies = Cryptocurrency.order('rank ASC').page(params[:page]).per(50)
    end
  
    @watchlist = current_user.watchlists.first if user_signed_in?
  end
  


  # GET /cryptocurrencies/:id
  def show
    
    if params[:keyword].present?
      redirect_to cryptocurrencies_path(keyword: params[:keyword])
    end

    @cryptocurrency = Cryptocurrency.find(params[:id])
    @sparkline_data = JSON.parse(@cryptocurrency.sparkline)  
  end


end