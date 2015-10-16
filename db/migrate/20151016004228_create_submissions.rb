class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :homework, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :sm_grade
      t.datetime :sm_date
      t.string :sm_src_code_dir

      t.timestamps null: false
    end
  end
end
