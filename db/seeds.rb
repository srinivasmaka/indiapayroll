# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

u=UserLogin.find_by_user_name('admin')

unless u
  puts "    creating user : admin"
  u = UserLogin.create!( user_name: "admin", 
            password: "railsrocks", 
            is_admin: "y")
end