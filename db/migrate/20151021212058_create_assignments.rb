class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :course, index: true, foreign_key: true
      t.references :homework, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
