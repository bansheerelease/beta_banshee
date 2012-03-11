class RemakeUserInfo < ActiveRecord::Migration
  def up
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

  def down
    create_table :user_infos do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :home_address
      t.string  :work_address
      t.string  :skype
      t.string  :birthday
      t.string  :family_status
      t.string  :home_city

      t.timestamps
    end
    drop_table :user_infos
  end
end
