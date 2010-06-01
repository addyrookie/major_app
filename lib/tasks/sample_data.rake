require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
  #  Rake::Task['db:reset'].invoke
     admin =   User.create!(:name => "Sample User",
                 :email => "sample@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
     admin.toggle!(:admin)    

    99.times do |n|
      name = Faker::Name.name
      email = "sample-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
                    :email => email,
                    :password => password,
                    :password_confirmation => password)
    end
  end
end
