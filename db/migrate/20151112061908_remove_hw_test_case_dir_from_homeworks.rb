class RemoveHwTestCaseDirFromHomeworks < ActiveRecord::Migration
  def change
    remove_column :homeworks, :hw_test_case_dir, :string
  end
end
