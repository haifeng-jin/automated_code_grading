class CreateCourseToHomeworks < ActiveRecord::Migration
  def change
    create_table :course_to_homeworks do |t|
      t.references :course, index: true, foreign_key: true
      t.references :homework, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
