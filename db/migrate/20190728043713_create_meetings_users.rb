class CreateMeetingsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings_users do |t|
      t.integer :meeting_id
      t.integer :user_id
    end
  end
end
