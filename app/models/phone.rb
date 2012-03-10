class Phone < ActiveRecord::Base

  belongs_to :user_info

  validates :phone_number, :uniqueness => true, :length => {:maximum => 13, :minimum => 7}
end
