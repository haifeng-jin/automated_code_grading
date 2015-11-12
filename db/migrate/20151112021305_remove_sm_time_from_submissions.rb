class RemoveSmTimeFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :sm_time, :datetime
  end
end
