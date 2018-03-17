class TvshowsController < ApplicationController
  
  
  def show
    @tvshow = Tvshow.find(params[:id])
  end
  
  def create
    @tvshow = current_user.tvshows.build(tvshow_params)
    if @tvshow.save
      flash[:success] = '番組を作成しました。'
      redirect_to root_url
    else
      @tvshows = current_user.tvshows.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '番組の作成に失敗しました。'
      render 'tvlistings/index'
    end
  end

  def destroy
  end
  
  private

  def tvshow_params
    params.require(:tvshow).permit(:showtitle, :show_length, :dow, :show_start_time)
  end
  
end
