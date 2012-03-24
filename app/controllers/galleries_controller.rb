
class GalleriesController < ApplicationController
  def index
    @title = 'Gallery'
    @galleries = current_user.galleries
    @user = current_user
  end

  def show
    @title = 'Gallery'
    @gallery = Gallery.find(params[:id])
  end

  def new
    @title = 'Gallery'
    @gallery = Gallery.new
  end

  def create
    @title = 'Gallery'
    @gallery = current_user.galleries.build(params[:gallery])
    if @gallery.save
      flash[:notice] = "Successfully created gallery."
      redirect_to @gallery
    else
      render :action => 'new'
    end
  end

  def edit
    @title = 'Gallery'
    @gallery = Gallery.find(params[:id])
  end

  def update
    @title = 'Gallery'
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery."
      redirect_to gallery_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @title = 'Gallery'
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully destroyed gallery."
    redirect_to galleries_url
  end

  def show_other_user
    @title = 'Gallery'
    @galleries = User.find(params[:id]).galleries
    @user = User.find(params[:id])
    render 'galleries/index'
  end

end

