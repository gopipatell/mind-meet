class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.integer :meeting_id
      t.integer :user_id
      t.text :description
      t.datetime :duedate
      t.boolean :is_done

      t.timestamps
    end
  end
end
