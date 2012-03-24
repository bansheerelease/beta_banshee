class PaintingsController < ApplicationController
  def new
    @title = 'Photos'
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  def create
    @title = 'Photos'
    @painting = Painting.new(params[:painting])
    if @painting.save
      flash[:notice] = "Successfully created painting."
      redirect_to @painting.gallery
    else
      render :action => 'new'
    end
  end

  def edit
    @title = 'Photos'
    @painting = Painting.find(params[:id])
  end

  def update
    @title = 'Photos'
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      flash[:notice] = "Successfully updated painting."
      redirect_to @painting.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @title = 'Photos'
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to @painting.gallery
  end

  def show
    @title = 'Photos'
    @painting = Painting.find(params[:id])
  end

end

