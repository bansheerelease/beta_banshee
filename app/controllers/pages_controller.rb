class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :help]

  def home
    @title = "Home"
    @users = Kaminari.paginate_array(User.all).page(params[:current_page])
  end

  def contact
    @title = "Contacts"
  end

  def help
    @title = "Help"
  end

  def profile
    @title = "Profile"
  end

  def list
    @title = "Title"
  end

  def follower
    render 'pages/followers'
  end

  def following
    render 'pages/following'
  end

def search
    if (!params[:user].nil?)
      @search_res_users = User.search(params[:search], :match_mode => :any).per(5)
    end
    if (!params[:profiles].nil?)
      @user_infos = UserInfo.search(params[:search], :match_mode => :any).per(5)
    end
    if (!params[:microposts].nil?)
      @microposts = Micropost.search(params[:search], :match_mode => :any).per(5)
    end
    if ((!params[:user].nil? && @search_res_users.empty?) || (!params[:profiles].nil? && @user_infos.empty?) || (!params[:microposts].nil? && @microposts.empty?))
      render 'shared/no_result'
    else
      render 'shared/search_result'
    end
  end


end

