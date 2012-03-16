class UserInfo < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :user_id, :home_address, :work_address, :skype, :birthday, :family_status, :phone_attributes, :gender, :country
  belongs_to :user

  define_index do
    indexes first_name, :as => :fname
    indexes last_name
    #indexes home_adress
    #indexes skype
    #indexes birthday
    #indexes family_status
    #indexes gender
    #indexes country
  end
end
