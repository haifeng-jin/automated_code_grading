class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :homework, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.float :sm_grade
      t.datetime :sm_time
      t.string :sm_src_dir, limit: 2047

      t.timestamps null: false
    end
  end
end
