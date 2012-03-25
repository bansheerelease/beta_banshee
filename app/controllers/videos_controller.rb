class VideosController < ApplicationController

  def index
    @user = User.find(params[:id])
    @videos = @user.videos
  end

  def create
    @video = current_user.videos.build(params[:video])
    if @video.save
      @video.convert
      flash[:notice] = 'Video has been uploaded'
      redirect_to '/' + current_user.id.to_s + '/videos/all'
    else
      render :action => 'new'
    end
  end

  def load_file
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

end

