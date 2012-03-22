class UserInfo < ActiveRecord::Base

  attr_accessible :first_name, :last_name,
                  :user_id, :home_address,
                  :work_address, :skype, :birthday,
                  :family_status, :phone_attributes,
                  :gender, :country
  belongs_to :user

  define_index do
    indexes first_name
    indexes last_name
    indexes home_address
    indexes skype
    indexes birthday
    indexes family_status
    indexes gender
    indexes country
  end
end

