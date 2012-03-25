class VideosController < ApplicationController

  # Find user by id and show his video list.
  def index
    @user = User.find(params[:id])
    @videos = @user.videos
  end

  # Create: download and convert video file for current_user.
  def create
    @video = current_user.videos.build(params[:video])
    if @video.save
      @video.convert
    end
   redirect_to '/' + current_user.id.to_s + '/videos/all'
  end

  def load_file
    @video = Video.new
  end

  # Displaying certain video file.
  def show
    @video = Video.find(params[:id])
  end

end

