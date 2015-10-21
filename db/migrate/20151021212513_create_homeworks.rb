class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :hw_name
      t.text :hw_description
      t.datetime :hw_release_date
      t.datetime :hw_due_date
      t.string :hw_test_case_dir

      t.timestamps null: false
    end
  end
end
