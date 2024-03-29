class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :help]


  # Set title for "/" home page.
  # Let to build chart for current_user.
  def home
    @title = "Home"
    @chart = ofc2(600,300,"/data")
  end

  # Set title for certain pages.
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
    @title = 'Readers'
    render 'pages/followers'
  end

  def following
    @title = 'Friends'
    render 'pages/following'
  end
  def galleries
    @title = "Galleries"
  end
  def paintings
    @title = "Paintings"
  end

  def video
  end

  def fun
    @title = 'Fun'
  end

  # Set title for the page 'user/user_id'
  # Get all the information for certain user.
  # Let to build chart for certain user.
  def all_about_us
    @title = 'Profile'
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to '/'
    end
    @chart = ofc2(600,300,"/other_data/" + @user.id.to_s)
  end

  # Realization of the Sphinx full-text search algorithm.
  def search
    found = false;
    if (!params[:user].nil?)
      if (params[:search].empty?)
        @search_res_users = Kaminari.paginate_array(User.all).page(params[:current_page]).per(10)
      else
        @search_res_users = User.search(params[:search], :match_mode => :any).page(params[:current_page]).per(10)
      end
      if (!@search_res_users.empty?)
        found = true
      end
    end
    if (!params[:profiles].nil?)
      if (!params[:search].empty?)
        @user_infos = UserInfo.search(params[:search], :match_mode => :any).page(params[:current_page]).per(10)
        if (!@user_infos.empty?)
          found = true
        end
      end
    end
    if (!params[:microposts].nil?)
      if (!params[:search].empty?)
        @microposts = Micropost.search(params[:search], :match_mode => :any).page(params[:current_page]).per(5)
        if (!@microposts.empty?)
          found = true
        end
      end
    end
    if (!found)
      render 'shared/no_result'
    else
      render 'shared/search_result'
    end
  end

end

