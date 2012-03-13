require 'spec_helper'

describe Micropost do

  before(:each) do
    User.create!(:email => 'test@test.com', :password => '1234567', :password_confirmation => '1234567').confirm!
    @user = User.find_by_email('test@test.com')
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.microposts.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @micropost = @user.microposts.create(@attr)
    end

    it "should have a user attribute" do
      @micropost.should respond_to(:user)
    end

    it "should have the right associated user" do
      @micropost.user_id.should == @user.id
      @micropost.user.should == @user
    end
  end

  describe "validations" do

    it "should require a user id" do
      Micropost.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.microposts.build(:content => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.microposts.build(:content => "a" * 301).should_not be_valid
    end
  end

  describe "from_users_followed_by" do

    before(:each) do
      @other_user = User.create!(:email => Factory.next(:email), :password => "1234567", :password_confirmation => "1234567")
      @other_user.confirm!
      @user = User.create!(:email => Factory.next(:email), :password => "1234567", :password_confirmation => "1234567")
      @user.confirm!
      @third_user = User.create!(:email => Factory.next(:email), :password => "1234567", :password_confirmation => "1234567")
      @third_user.confirm!
      #sign_in @user

      @user_post  = @user.microposts.create!(:content => "foo")
      @other_post = @other_user.microposts.create!(:content => "bar")
      @third_post = @third_user.microposts.create!(:content => "baz")

      @user.follow!(@other_user)
    end

    it "should have a from_users_followed_by class method" do
      Micropost.should respond_to(:from_users_followed_by)
    end

    it "should include the followed user's microposts" do
      Micropost.from_users_followed_by(@user).should include(@other_post)
    end

    it "should include the user's own microposts" do
      Micropost.from_users_followed_by(@user).should include(@user_post)
    end

    it "should not include an unfollowed user's microposts" do
      Micropost.from_users_followed_by(@user).should_not include(@third_post)
    end
  end

end
