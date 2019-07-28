# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :text
#  email           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  has_many :hostedMeetings, :class_name => :Meeting, :foreign_key => "host_id"

  has_and_belongs_to_many :meetings

  has_many :actions

end
