class Gallery < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  has_many :paintings
end

