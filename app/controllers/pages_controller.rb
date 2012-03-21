class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :help]

  def home
    @title = "Home"
    @users = Kaminari.paginate_array(User.all).page(params[:current_page])
    @chart = open_flash_chart_object(600,300,"/data")
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
    found = false;
    #посмотреть, если есть пробелы, по юзаем :any, иначе :all
    if (!params[:user].nil?)
      @search_res_users = User.search(params[:search], :match_mode => :any).page(params[:current_page]).per(5)
      if (!@search_res_users.empty?)
        found = true
      end
    end
    if (!params[:profiles].nil?)
      @user_infos = UserInfo.search(params[:search], :match_mode => :any).page(params[:current_page]).per(5)
      if (!@user_infos.empty?)
        found = true
      end
    end
    if (!params[:microposts].nil?)
      @microposts = Micropost.search(params[:search], :match_mode => :any).page(params[:current_page]).per(5)
      if (!@microposts.empty?)
        found = true
      end
    end
    if (!found)
      render 'shared/no_result'
    else
      render 'shared/search_result'
    end
  end

end

