class UserInfo < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :user_id
  belongs_to :user
  has_many :phone

  validates :first_name, :presence => true
  validates :last_name, :presence => true

end
