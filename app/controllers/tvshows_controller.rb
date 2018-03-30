class TvshowsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @tvshow = Tvshow.find(params[:id])
    # @tvshow_build = current_user.tvshows.build(tvshow_params)
    
  end
  
  def create
    @tvshow = current_user.tvshows.build(tvshow_params)
    
    
    
    if @tvshow.save
      flash[:success] = '番組を作成しました。'
      
      # tvlisting/5から作成したのなら
      # tvlisting/5に戻りたい
      # メッセージボードの場合
      # @message = Message.find(params[:id])
      # redirect_to @message
      
      redirect_to controller: 'tvlistings', action: 'show', id: @tvshow.tvlisting_id
    else
      @tvshows = current_user.tvshows.order('created_at DESC').page(params[:page])
      #@tvlisting = Tvlisting.find(params[:id])
      @tvlisting = Tvlisting.find(@tvshow.tvlisting_id)
      flash.now[:danger] = '番組の作成に失敗しました。'
      
      
      
      
      # 'tvlistings/3'ではrender出来ない
      # render :template => "posts/show", :locals => {:post => @post}
      # 番組表id:<%= @tvlisting.id %> @tvlistingを渡さねばならない
      # エラーのところ難しいので保留
      
      render :action => '../tvlistings/show', :id => @tvshow.id 
      
      
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
    
    
    @tvshow.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def tvshow_params
    params.require(:tvshow).permit(:showtitle, :show_length, :show_length_int, :dow, :show_start_time, :tvshow_id, :tvlisting_id)
  end
  
  
  def correct_user
    @tvshow = current_user.tvshows.find_by(id: params[:id])
    unless @tvshow
      redirect_to root_url
    end
  end
  
end
