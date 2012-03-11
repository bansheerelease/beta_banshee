require 'spec_helper'

describe "user_infos/index" do
  before(:each) do
    assign(:user_infos, [
      stub_model(UserInfo,
        :first_name => "First Name",
        :last_name => "Last Name",
        :home_address => "Home Address",
        :work_address => "Work Address",
        :skype => "Skype",
        :birthday => "Birthday",
        :family_status => "Family Status",
        :home_city => "Home City"
      ),
      stub_model(UserInfo,
        :first_name => "First Name",
        :last_name => "Last Name",
        :home_address => "Home Address",
        :work_address => "Work Address",
        :skype => "Skype",
        :birthday => "Birthday",
        :family_status => "Family Status",
        :home_city => "Home City"
      )
    ])
  end

  it "renders a list of user_infos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Home Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Work Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Skype".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Birthday".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Home City".to_s, :count => 2
  end
end
