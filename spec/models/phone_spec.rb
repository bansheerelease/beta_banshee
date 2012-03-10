require 'spec_helper'

describe Phone do

  it "must belong to user_info" do
    @info = UserInfo.create(:first_name => "Igor", :last_name => "pertsav")
    @phone = @info.phone.create(:phone_number => "1234567")
    @phone.user_info_id.should == @info.id
    @phone.user_info.should == @info
  end

  it "must be between 7 and 13 symbols length" do
    @phone = Phone.create(:phone_number => '123445')
    @phone.should_not be_valid
    @phone = Phone.create(:phone_number => '123456789')
    @phone.should be_valid
    @phone = Phone.create(:phone_number => '12345678910111')
    @phone.should_not be_valid
  end
end
