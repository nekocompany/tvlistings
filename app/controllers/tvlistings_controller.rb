class TvlistingsController < ApplicationController
  def index
    
    
    if logged_in?
      @user = current_user
      @tvshow = current_user.tvshows.build  # form_for 用
      @tvshows = current_user.tvshows.order('dow').page(params[:page])
      
      
      
      if params[:id].present?
        
        
        
        @tvshow = Tvshow.find(params[:id])
      else
        @tvshow = current_user.tvshows.build
      end
      
      
    end
    
  end

  def show
    
  end

  def new
  end

  def create
  end
end
