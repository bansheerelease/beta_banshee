class GalleriesController < ApplicationController

  # Set title for the page '/galleries'.
  # Show all galleries of the current_user.
  def index
    @title = 'Gallery'
    @galleries = current_user.galleries
    @user = current_user
  end

  # Set title for the page '/galleries/:id/paintings/:id'.
  # Show certain painting from certain gallery.
  def show
    @title = 'Gallery'
    @gallery = Gallery.find(params[:id])
  end

  # Set title for the page 'user.id/galleries'.
  def show_other_user
    @title = 'Gallery'
    @galleries = User.find(params[:id]).galleries
    @user = User.find(params[:id])
    render 'galleries/index'
  end

  # Set title for the page 'galleries/new'.
  # Create new Gallery for current_user.
  def create
    @title = 'Gallery'
    @gallery = current_user.galleries.build(params[:gallery])
    if @gallery.save
      redirect_to @gallery
    else
      render :action => 'new'
    end
  end

  def new
    @title = 'Gallery'
    @gallery = Gallery.new
  end


  # Delet certain gallery for the current_user.
  # After this action redirect to the page '/galleries'.
  def destroy
    @title = 'Gallery'
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_url
  end

end

