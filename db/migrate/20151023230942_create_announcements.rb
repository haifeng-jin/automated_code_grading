class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :announcement_description
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
