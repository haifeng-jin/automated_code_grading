class Homework < ActiveRecord::Base
  has_many :assignments
  has_many :courses, through: :assignments
  has_many :submissions

end
