class TvshowsController < ApplicationController
  
  
  def show
    @tvshow = Tvshow.find(params[:id])
    # @tvshow_build = current_user.tvshows.build(tvshow_params)
  end
  
  def create
    @tvshow = current_user.tvshows.build(tvshow_params)
    
    
    
    @tvshow.show_length_int = 
    (@tvshow.show_length.time.hour * 3600) + 
    (@tvshow.show_length.time.min * 60) + 
    @tvshow.show_length.time.sec
    
    
    
    
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
    
    binding.pry
    
    @tvshow.show_length_int = 
    (@tvshow.show_length.time.hour * 3600) + 
    (@tvshow.show_length.time.min * 60) + 
    @tvshow.show_length.time.sec
    
    binding.pry

   
    if @tvshow.update(tvshow_params)
      
      binding.pry
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
    params.require(:tvshow).permit(:showtitle, :show_length, :show_length_int, :dow, :show_start_time)
  end
  
end
