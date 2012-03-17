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
    redirect_back = true
    if (params[:user] == 1)
      @search_res_users = User.search(params[:search], :match_mode => :any)
      if (!@search_res_users.empty?)
        redirect_back = false
      end
      #render '/shared/user_search'
    end
    if (!params[:profiles].nil?)
      @user_infos = UserInfo.search(params[:search], :match_mode => :any)
      if (!@user_infos.empty?)
        redirect_back = false
      end
      #render '/shared/user_info_search'
    end
    if (!params[:microposts].nil?)
      @microposts = Micropost.search(params[:search], :match_mode => :any)
      if (!@microposts.empty?)
        redirect_back = false
      end
      #render 'microposts/show'
    end
    if redirect_back
      render 'shared/no_result'
    else
      render 'shared/search_result'
    end
  end

end
