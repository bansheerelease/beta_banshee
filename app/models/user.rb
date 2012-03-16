class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :user_info, :dependent => :destroy
  has_many :microposts, :dependent => :destroy

  has_many :relationships, :foreign_key => "follower_id",
           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
           :class_name => "Relationship",
           :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  define_index do
    indexes email
  end

  def full_name
    if (self.user_info.nil?) || (self.user_info.first_name == '+' && self.user_info.last_name == '+')
      self.email
    else
      if self.user_info.first_name == '+'
        self.user_info.last_name
      else
        if self.user_info.last_name == '+'
          self.user_info.first_name
        else
          self.user_info.first_name + ' ' + self.user_info.last_name
        end
      end
    end
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def feed
    Micropost.from_users_followed_by(self)
  end
  #First try
end

