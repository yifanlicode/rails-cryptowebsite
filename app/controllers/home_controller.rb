class HomeController < ApplicationController
  
  def index
    if params[:keyword].present?
      redirect_to cryptocurrencies_path(keyword: params[:keyword])
    end
  end


  def about


      if params[:keyword].present?
        redirect_to cryptocurrencies_path(keyword: params[:keyword])
      end
    @about_me = <<-ABOUT_ME
    Hi there! I am Yifan, a full-stack development student at Red River College Polytechnic in Canada.
    Feel free to email(yifanlicode@gmail.com) me.
  ABOUT_ME
  end
  
end
