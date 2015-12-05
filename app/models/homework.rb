class Homework < ActiveRecord::Base
  has_many :submissions
  has_many :course_to_homeworks
  has_many :courses, through: :course_to_homeworks

end
