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
    @title = "profile"
    @user_info = UserInfo.find_by_id(current_user.id)
    if @user_info.nil?
      @user_info = UserInfo.create()
    end
  end
end
