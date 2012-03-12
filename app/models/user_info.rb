class UserInfo < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :user_id, :home_address, :work_address, :skype, :birthday, :family_status, :home_city, :phone_attributes, :gender, :country
  belongs_to :user

end
