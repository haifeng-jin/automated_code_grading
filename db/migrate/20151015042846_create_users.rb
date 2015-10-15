class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_email
      t.string :user_password
      t.string :user_class
      t.integer :user_role

      t.timestamps null: false
    end
  end
end
