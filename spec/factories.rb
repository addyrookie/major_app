# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.name  "Aditya Dixit"
  user.email "adityadixit06@gmail.com"
  user.password  "akkuakku"
  user.password_confirmation "akkuakku"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
 
