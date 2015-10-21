class User < ActiveRecord::Base
  has_many :course_to_users
  has_many :courses, through: :course_to_users
  has_many :submissions
end
