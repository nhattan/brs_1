class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :relationship_id
      t.integer :user_book_id
      t.integer :review_id
      t.integer :comment_id
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
