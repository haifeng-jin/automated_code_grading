class User < ActiveRecord::Base
  belongs_to :course
  has_many :homeworks
  has_many :submissions
  has_many :courses
end
