require 'spec_helper'

describe "user_infos/show" do
  before(:each) do
    @user_info = assign(:user_info, stub_model(UserInfo,
      :first_name => "First Name",
      :last_name => "Last Name",
      :home_address => "Home Address",
      :work_address => "Work Address",
      :skype => "Skype",
      :birthday => "Birthday",
      :family_status => "Family Status",
      :home_city => "Home City"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Home Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Work Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Skype/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Birthday/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Home City/)
  end
end
