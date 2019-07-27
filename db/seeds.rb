# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
puts "Creating Users"
u1 = User.create :name => 'Adam', :email => 'adam@gmail.com', :password => 'chicken'


Meeting.destroy_all
puts "Creating Meetings"

m1 = Meeting.create :title => 'Monday meeting'
m2 = Meeting.create :title => 'Wednesday meeting'
m3 = Meeting.create :title => 'Friday meeting'

# User and Meetings
u1.hostedMeetings << m1 << m2 << m3
