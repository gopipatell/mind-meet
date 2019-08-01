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

m1 = Meeting.create :title => 'client Requirement changed',:description =>'Client has made some changes to the requirement we need to do this chenges as a high priority', :agenda1 => 'UI Changes', :agenda2 => 'database changes',:agenda3=>'Discuss on time it will take',:duration => 45, :start => '2019-08-10'

m2 = Meeting.create :title => 'open day planning', :description => 'what are we doing on the dayand how all staff and voluntaries are involved', :agenda1 =>'staff responsibility',:agenda2 => 'voluntaries', :agenda3 => 'setup on the day' ,:duration => 30, :start => '2019-08-11'

m3 = Meeting.create :title => 'Agile Retro', :description => 'Feedback about the project how was the project release', :agenda1 => 'What went well',:agenda2 =>'what to improve', :agenda3 => 'what went wrong', :duration => 60, :start => '2019-08-11'


Action.destroy_all
puts "Creating Actions"

a1 = Action.create :description => 'Change the fonts and the home page to carousel theme',:duedate => '2019-09-10', :is_done => false
a2 = Action.create :description => 'Have to add upload image field in the user database.',:duedate => '2019-09-01', :is_done => false
a3 = Action.create :description =>'Neet to test all the changes',:duedate => '2019-09-10', :is_done => false

a4 = Action.create :description =>'Have to assign the task to all staff',:duedate => '2019-09-10', :is_done => true
a5 = Action.create :description =>'talk to studnets who are will to work on open day',:duedate => '2019-09-10', :is_done => true
a6 = Action.create :description =>'come early to help setup',:duedate => '2019-09-10', :is_done => false


a7 = Action.create :description =>'did not get the work done front end team',:duedate => '2019-09-01', :is_done => true
a8 = Action.create :description =>'client was clear on his side on what he needs',:duedate => '2019-09-02', :is_done => true
a9 = Action.create :description =>'story was not clear at the start of the project',:duedate => '2019-09-04', :is_done => true


# Meeting assigned to User
u1.hostedMeetings << m1
u2.hostedMeetings << m2
u3.hostedMeetings << m3
u1.meetings << m1 << m2 << m3
u2.meetings << m1 << m2
u3.meetings << m2 << m3 << m1
u4.meetings << m2 << m3
u5.meetings << m2 << m3



# Actions assigned to User and Meeting
m1.actions << a1
m1.actions << a2
m2.actions << a3
m2.actions << a4

u1.actions << a1
u1.actions << a3
u2.actions << a2
u2.actions << a4
