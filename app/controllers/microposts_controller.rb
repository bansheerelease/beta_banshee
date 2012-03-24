class MicropostsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @title = 'Microposts'
    @user = User.find(current_user.id)
    feed = @user.feed
    @microposts = feed.page(params[:current_page]).per(5)
    @new_post = Micropost.new if @new_post.nil?
  end

  def show_other_user
    @title = 'Microposts'
    @user = User.find(params[:id])
    @microposts = @user.feed.page(params[:current_page]).per(5)
    @new_post = Micropost.new if @new_post.nil?
    render 'microposts/show'
  end

  def create
    @title = 'Microposts'
    @new_post  = current_user.microposts.build(params[:micropost])
    if @new_post.save
      flash[:success] = "Micropost created!"
      @user = User.find(current_user.id)
      feed = @user.feed
      @microposts = feed.page(params[:current_page]).per(5)
    end
    respond_to do |format|
      format.html { redirect_to '/wall' }
      format.js
    end
  end

  def destroy
    @title = 'Microposts'
    @micropost = Micropost.find_by_id(params[:id])
    @micropost.destroy
    @user = User.find(current_user.id)
    feed = @user.feed
    @microposts = feed.page(params[:current_page]).per(5)
    respond_to do |format|
      format.html { redirect_to '/wall' }
      format.js
    end
  end

end

