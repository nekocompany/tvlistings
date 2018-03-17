class TvlistingsController < ApplicationController
  def index
    total_seconds = 1440
    @show_length = Time.at(total_seconds).utc.strftime("%H:%M:%S")
    
    if logged_in?
      @user = current_user
      @tvshow = current_user.tvshows.build  # form_for 用
      @tvshows = current_user.tvshows.order('created_at DESC').page(params[:page])
    end
    
  end

  def show
    
  end

  def new
  end

  def create
  end
end
