class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :sm_homework_id
      t.integer :sm_user_id
      t.float :sm_grade
      t.datetime :sm_date
      t.string :sm_src_code_dir, limit: 2047

      t.timestamps null: false
    end
  end
end
