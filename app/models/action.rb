# == Schema Information
#
# Table name: actions
#
#  id          :bigint           not null, primary key
#  meeting_id  :integer
#  user_id     :integer
#  description :text
#  duedate     :datetime
#  is_done     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Action < ApplicationRecord

  belongs_to :user
  belongs_to :meeting

end
