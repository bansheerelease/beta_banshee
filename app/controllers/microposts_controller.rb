class MicropostsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 10)
    @new_post = Micropost.new if @new_post.nil?
  end

  def create
    @new_post  = current_user.microposts.build(params[:micropost])
    if @new_post.save
      flash[:success] = "Micropost created!"
      redirect_to '/wall'
    else
      @user = User.find(current_user.id)
      @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 10)
      render 'microposts/show'
    end
  end

  def destroy
    @micropost = Micropost.find_by_id(params[:id])
    @micropost.destroy
    redirect_to '/wall'
  end
end
