require 'spec_helper'

describe PagesController do
  render_views
  include Devise::TestHelpers

  before :each do
    @user = User.new(:email => "test@test.com", :password => "1234567", :password_confirmation => "1234567")
    sign_in :user,@user
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                                    :content => "Home")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                                    :content => "Contact")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                                    :content => "Help")
    end
  end

  describe "render left_column template" do

    describe "when not signed in" do

      before(:each) do
        render_template('layouts/leftColumn')
      end

      it "should be successful" do
        response.should be_success
      end

    end

    describe "when signed in" do

      before(:each) do
        @user = User.create!(:email => Factory.next(:email), :password => "1234567", :password_confirmation => "1234567")
        @user.confirm!
        sign_in :user,@user
        @follower = User.create!(:email => Factory.next(:email), :password => "1234567", :password_confirmation => "1234567")
        @follower.follow!(@user)
      end

      it "should have the right follower/following counts" do
        get 'home'

        response.should have_selector("a", :href => '/followers')
        response.should have_selector("a", :href => '/following')
      end
    end
  end


end
