class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.integer :user_info_id

      t.timestamps
    end
    add_index :phones, :user_info_id
  end
end
