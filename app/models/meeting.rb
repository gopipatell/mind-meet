# == Schema Information
#
# Table name: meetings
#
#  id          :bigint           not null, primary key
#  title       :text
#  agenda1     :text
#  agenda2     :text
#  agenda3     :text
#  start       :datetime
#  duration    :integer
#  host_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Meeting < ApplicationRecord
  validates :title,:agenda1, :presence => true

  belongs_to :host, :class_name => :User, :foreign_key => "host_id"

  has_and_belongs_to_many :users

  has_many :actions

end
