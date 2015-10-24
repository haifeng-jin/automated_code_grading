class Submission < ActiveRecord::Base
  belongs_to :homework
  belongs_to :user
  belongs_to :course
end
