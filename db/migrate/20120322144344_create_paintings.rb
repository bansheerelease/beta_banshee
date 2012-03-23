class CreatePaintings < ActiveRecord::Migration
  def self.up
    create_table :paintings do |t|
      t.integer :gallery_id
      t.string :name
      t.integer :gallery_id
      t.timestamps
    end
  add_index :paintings, :gallery_id
  end

  def self.down
    drop_table :paintings
  end
end

