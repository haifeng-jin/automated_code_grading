class AddHwTestCaseDirToCourseToHomeworks < ActiveRecord::Migration
  def change
    add_column :course_to_homeworks, :hw_test_case_dir, :string
  end
end
