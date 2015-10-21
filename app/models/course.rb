class Course < ActiveRecord::Base
  has_many :course_to_users
  has_many :users, through: :course_to_users

  has_many :assignments
  has_many :homeworks, through: :assignments
end
