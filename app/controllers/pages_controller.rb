class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :help]

  def home
    @title = "Home"
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
end
