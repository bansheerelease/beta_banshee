class RecreateUserInfo < ActiveRecord::Migration
  def up
    drop_table :user_infos
    create_table :user_infos do |t|
      t.string  :first_name, :default => '+'
      t.string  :last_name, :default => '+'
      t.string  :home_address, :default => '+'
      t.string  :work_address, :default => '+'
      t.string  :skype, :default => '+'
      t.string  :birthday, :default => '+'
      t.string  :family_status, :default => '+'
      t.string  :gender, :default => 'Male'
      t.string  :country, :default => '+'
      t.integer :user_id

      t.timestamps
    end
    add_index :user_infos, :user_id
  end

  def down
    drop_table :user_infos
    create_table :user_infos do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :home_address
      t.string  :work_address
      t.string  :skype
      t.string  :birthday
      t.string  :family_status
      t.string  :home_city
      t.integer :user_id

      t.timestamps
    end
    add_index :user_infos, :user_id
  end
end
