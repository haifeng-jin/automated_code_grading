class Course < ActiveRecord::Base
  has_many :course_to_users
  has_many :users, through: :course_to_users

  has_many :course_to_homeworks
  has_many :homeworks, through: :course_to_homeworks

  def self.get_courseName(course_id)
    if course_id == nil
      return 'Null'
    else
      return self.find(course_id).course_name
    end
  end

end
