class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.text :title
      t.text :agenda1
      t.text :agenda2
      t.text :agenda3
      t.datetime :start
      t.integer :duration
      t.integer :host_id

      t.timestamps
    end
  end
end
