class HomeController < ApplicationController
  
  def about
    @about_me = <<-ABOUT_ME
    Hi there! I am Yifan, a full-stack development student at Red River College Polytechnic in Canada.
    Feel free to email(yifanlicode@gmail.com) me.
  ABOUT_ME
  end
  
end
