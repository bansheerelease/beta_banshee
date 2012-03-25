class MicropostsController < ApplicationController

  before_filter :authenticate_user!

  # Set title for the page '/wall'.
  # Set @user as a current_user.
  # Get scoped micropost list for current_user.
  # Pagination: it will get ONLY certain count of post from data base.
  def show
    @title = 'Microposts'
    @user = User.find(current_user.id)
    feed = @user.feed
    @microposts = feed.page(params[:current_page]).per(5)
    @new_post = Micropost.new if @new_post.nil?
    # Realization of the endless page via ajax.
    respond_to do |format|
      format.js
      format.html
      format.xml  { render :xml => @micropost }
    end
  end

  # Set title for the page '/wall/user_id'.
  # Find certain user by id.
  # Get scoped micropost list for certain user.
  def show_other_user
    @title = 'Microposts'
    @user = User.find(params[:id])
    @microposts = @user.feed.page(params[:current_page]).per(5)
    @new_post = Micropost.new if @new_post.nil?
    render 'microposts/show'
  end

  # Set title for the page '/wall'.
  # Create new micropost via ajax for current_user.
  def create
    @title = 'Microposts'
    @new_post  = current_user.microposts.build(params[:micropost])
    if @new_post.save
      @user = User.find(current_user.id)
      feed = @user.feed
      @microposts = feed.page(params[:current_page]).per(5)
    end
    respond_to do |format|
      format.html { redirect_to '/wall' }
      format.js
    end
  end

  # Set title for the page '/wall'.
  # Destroy certain micropost via ajax for current_user.
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

