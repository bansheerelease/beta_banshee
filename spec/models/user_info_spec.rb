require 'spec_helper'

describe UserInfo do
  describe "must" do

    before :each do
      User.create(:email => "test@test.com", :password => "1234567", :password_confirmation => "1234567").confirm!
      @user = User.first
      @attribute = { :first_name => "Igor", :last_name => "Pertsav", :user_id => @user.id }
      @correct_user_info = UserInfo.create(@attribute)
    end

    it "create correct instance with correct attributes" do
      UserInfo.create(@attribute)
    end

    it "contain first name" do
      @correct_user_info.should respond_to(:first_name)
    end

    it "contain last name" do
      @correct_user_info.should respond_to(:last_name)
    end

    it "have right user, associated with him" do
      @user.should respond_to(:user_info)
      @correct_user_info.user_id.should == @user.id
      @correct_user_info.user.should == @user
    end

  end
end
