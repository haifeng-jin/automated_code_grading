class Course < ActiveRecord::Base
  belongs_to :user
  has_many :users

  def self.get_courseName(course_id)
    if course_id == nil
      return 'Null'
    else
      return self.find(course_id).course_name
    end
  end

end
