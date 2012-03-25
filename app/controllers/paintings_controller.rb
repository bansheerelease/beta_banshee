class PaintingsController < ApplicationController

  # Set title for the page 'paintings/new?gallery_id=..'.
  # Create new painting for current user gallery.
  def create
    @title = 'Photos'
    @painting = Painting.new(params[:painting])
    if @painting.save
      redirect_to @painting.gallery
    else
      render :action => 'new'
    end
  end

  def new
    @title = 'Photos'
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  # Show the certain painting in default size.
  def show
    @title = 'Photos'
    @painting = Painting.find(params[:id])
  end

  # Set title for the page 'paintings/painting_id/edit'.
  # Update certain painting selected by painting_id for current user gallery.
  def update
    @title = 'Photos'
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      redirect_to @painting.gallery
    else
      render :action => 'edit'
    end
  end

  def edit
    @title = 'Photos'
    @painting = Painting.find(params[:id])
  end

  # Update certain painting selected by painting_id for current user gallery.
  def destroy
    @title = 'Photos'
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to @painting.gallery
  end

end

