class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_address
      t.string :work_address
      t.string :skype
      t.string :birthday
      t.string :family_status
      t.string :home_city

      t.timestamps
    end
  end
end
