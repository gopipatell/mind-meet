# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  id         :bigint           not null, primary key
#  title      :text
#  agenda1    :text
#  agenda2    :text
#  agenda3    :text
#  start      :datetime
#  duration   :integer


User.destroy_all
puts "Creating Users"
u1 = User.create :name => 'Adam', :email => 'adam@gmail.com', :password => 'chicken'
u2 = User.create :name => 'Gopi', :email => 'gopi@gmail.com', :password => 'chicken'
u3 = User.create :name => 'John', :email => 'john@gmail.com', :password => 'chicken'
u4 = User.create :name => 'Mary', :email => 'mary@gmail.com', :password => 'chicken'
u5 = User.create :name => 'Paul', :email => 'paul@gmail.com', :password => 'chicken'


Meeting.destroy_all
puts "Creating Meetings"

m1 = Meeting.create :title => 'Monday meeting', :agenda1 => 'New Busuiness', :agenda2 => 'planning', :duration =>30, :start => '2019-08-10'
m2 = Meeting.create :title => 'Wednesday meeting', :agenda1 =>'openday planning', :duration => 30, :start => '2019-08-11'
m3 = Meeting.create :title => 'Friday meeting', :agenda1 => 'graduation planning', :duration => 60, :start => '2019-07-31'


Action.destroy_all
puts "Creating Actions"

a1 = Action.create :description => 'My todo 1', :is_done => false
a2 = Action.create :description => 'My todo 2', :is_done => false
a3 = Action.create :description => 'My todo 3', :is_done => true
a4 = Action.create :description => 'My todo 4', :is_done => true


# Meeting assigned to User
u1.hostedMeetings << m1 << m2 << m3
u1.meetings << m1 << m2 << m3

u2.meetings << m1 << m2
u3.meetings << m2


# Actions assigned to User and Meeting
m1.actions << a1
m1.actions << a2
m2.actions << a3
m2.actions << a4

u1.actions << a1
u1.actions << a3
u2.actions << a2
u2.actions << a4
