class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :category_id
      t.string :title
      t.string :summary
      t.string :author
      t.integer :page
      t.integer :rating
      t.datetime :published_at

      t.timestamps
    end
  end
end
