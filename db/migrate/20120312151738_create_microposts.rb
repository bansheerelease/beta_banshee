class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, :user_id
    add_index :microposts, :created_at
  end
end
