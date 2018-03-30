class TvlistingsController < ApplicationController
  def index
    
    
    if logged_in?
      @user = current_user
      @tvlisting = current_user.tvlistings.build  # form_for 用
      @tvlistings = current_user.tvlistings.order('created_at DESC').page(params[:page])
      
      
      
      if params[:id].present?
        
        @tvlisting = Tvlisting.find(params[:id])
      else
        @tvlisting = current_user.tvlistings.build
      end
      
      
    end
    
  end

  def show
    @tvlisting = Tvlisting.find(params[:id])
    @tvshow = current_user.tvshows.build # form_for 用
    @tvshows = @tvlisting.tvshows.order('dow').page(params[:page])
  end

  def new
  end

  def create
    @tvlisting = current_user.tvlistings.build(tvlisting_params)
    
    
    if @tvlisting.save
      flash[:success] = '番組表を作成しました。'
      redirect_to action: 'index'
    else
      @tvlistings = current_user.tvlistings.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '番組表の作成に失敗しました。'
      render 'tvlistings/index'
    end
  end
  
  def update
    @tvlisting = Tvlisting.find(params[:id])
    
   
    if @tvlisting.update(tvlisting_params)
      
      
      flash[:success] = '番組表は正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '番組表は更新されませんでした'
      render 'tvlistings/index'
    end
  end
  
  def destroy
    
    
    @tvlisting.destroy
    flash[:success] = '番組表を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def tvlisting_params
    params.require(:tvlisting).permit(:title)
  end
  
  
  def correct_user
    @tvlisting = current_user.tvlistings.find_by(id: params[:id])
    unless @tvlisting
      redirect_to root_url
    end
  end
  
  
end
