require 'spec_helper'

describe MicropostsController do
  include Devise::TestHelpers

  describe "access control" do

    before :each do
      @user = User.create!(:email => "test@test.com", :password => "1234567", :password_confirmation => "1234567")
      @user.confirm!
      #sign_in @user
    end

    it "should deny access to 'create'" do
      post :create, :user => @user
      response.status.should be(302)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1, :user => @user
      response.status.should be(302)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = User.create!(:email => "test@test.com", :password => "1234567", :password_confirmation => "1234567")
      @user.confirm!
      sign_in @user
    end

    describe "failure" do

      before(:each) do
        @attr = { :content => "" }
      end

      it "should not create a micropost" do
        lambda do
          post :create, :micropost => @attr
        end.should_not change(Micropost, :count)
      end

      it "should go to the wall page" do
        post :create, :micropost => @attr
        response.should redirect_to('/wall')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :content => "Lorem ipsum" }
      end

      it "should create a micropost" do
        lambda do
          post :create, :micropost => @attr
        end.should change(Micropost, :count).by(1)
      end

      it "should redirect to the wall page" do
        post :create, :micropost => @attr
        response.should redirect_to('/wall')
      end

      it "should have a flash message" do
        post :create, :micropost => @attr
        flash[:success].should =~ /micropost created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = User.create!(:email => "test@test.com", :password => "1234567", :password_confirmation => "1234567")
        @user.confirm!
        wrong_user = User.create!(:email => "test2@test.com", :password => "1234567", :password_confirmation => "1234567")
        wrong_user.confirm!
        sign_in wrong_user
        @micropost = @user.microposts.create(:content => "Lorem ipsum")
      end

      it "should deny access" do
        puts @micropost.inspect
        delete :destroy, :id => @micropost.id
        response.should redirect_to('/wall')
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = User.create!(:email => "test@test.com", :password => "1234567", :password_confirmation => "1234567")
        @user.confirm!
        sign_in @user
        @micropost = @user.microposts.create(:content => "Lorem ipsum2")
      end

      it "should destroy the micropost" do
        lambda do
          puts @micropost.inspect
          delete :destroy, :id => @micropost.id
        end.should change(Micropost, :count).by(-1)
      end
    end
  end
end
