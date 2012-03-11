# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(:email => "test@test.com",
                    :password => "1234567",
                    :password_confirmation => "1234567").confirm!
user2 = User.create(:email => "test2@test.com",
                    :password => "1234567",
                    :password_confirmation => "1234567").confirm!
user3 = User.create(:email => "test3@test.com",
            :password => "1234567",
            :password_confirmation => "1234567").confirm!

AdminUser.create(:email => 'admin@admin.com', :password => 'admin1', :password_confirmation => 'admin1').confirm!
