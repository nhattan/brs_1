class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :object_id
      t.string :object_type
      t.string :event

      t.timestamps
    end
    
    add_index :activities, :object_id
    add_index :activities, :object_type
    add_index :activities, :user_id
  end
end
