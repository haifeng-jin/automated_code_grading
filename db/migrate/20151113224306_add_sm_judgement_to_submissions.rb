class AddSmJudgementToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :sm_judgement, :string
  end
end
