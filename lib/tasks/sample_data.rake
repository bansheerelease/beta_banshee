namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    res = User.create!(
                 :email => "example@example.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    res.confirm!
    30.times do |n|
      email = "test#{n+1}@test.org"
      password  = "password"
      res = User.create!(
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
      res.confirm!
    end
  end
end