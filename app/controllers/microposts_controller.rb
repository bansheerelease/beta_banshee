class MicropostsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = User.find(current_user.id)
    feed = @user.feed
    @microposts = feed.page(params[:current_page]).per(5)
    @new_post = Micropost.new if @new_post.nil?
  end

  def show_other_user
    @user = User.find(params[:id])
    @microposts = @user.feed.page(params[:current_page]).per(5)
    @new_post = Micropost.new if @new_post.nil?
    render 'microposts/show'
  end

  def create
    @new_post  = current_user.microposts.build(params[:micropost])
    if @new_post.save
      flash[:success] = "Micropost created!"
      redirect_to '/wall'
    else
      @user = User.find(current_user.id)
      @microposts = @user.microposts.page(params[:current_page]).per(5)
      render 'microposts/show'
    end
  end

  def destroy
    @micropost = Micropost.find_by_id(params[:id])
    @micropost.destroy
    redirect_to '/wall'
  end

end

