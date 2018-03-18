class TvshowsController < ApplicationController
  
  
  def show
    @tvshow = Tvshow.find(params[:id])
    # @tvshow_build = current_user.tvshows.build(tvshow_params)
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
  
  def update
    @tvshow = Tvshow.find(params[:id])

    if @tvshow.update(tvshow_params)
      flash[:success] = '番組内容は正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = '番組内容は更新されませんでした'
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
