require 'spec_helper'

describe "user_infos/edit" do
  before(:each) do
    @user_info = assign(:user_info, stub_model(UserInfo,
      :first_name => "MyString",
      :last_name => "MyString",
      :home_address => "MyString",
      :work_address => "MyString",
      :skype => "MyString",
      :birthday => "MyString",
      :family_status => "MyString",
      :home_city => "MyString"
    ))
  end

  it "renders the edit user_info form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_infos_path(@user_info), :method => "post" do
      assert_select "input#user_info_first_name", :name => "user_info[first_name]"
      assert_select "input#user_info_last_name", :name => "user_info[last_name]"
      assert_select "input#user_info_home_address", :name => "user_info[home_address]"
      assert_select "input#user_info_work_address", :name => "user_info[work_address]"
      assert_select "input#user_info_skype", :name => "user_info[skype]"
      assert_select "input#user_info_birthday", :name => "user_info[birthday]"
      assert_select "input#user_info_family_status", :name => "user_info[family_status]"
      assert_select "input#user_info_home_city", :name => "user_info[home_city]"
    end
  end
end
