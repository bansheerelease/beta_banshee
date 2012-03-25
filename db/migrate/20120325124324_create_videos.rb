class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :name
      t.string :source_content_type
      t.string :source_file_name
      t.integer :source_file_size
      t.string :state
      t.timestamps
    end

  add_index :videos, :user_id
  end

end

