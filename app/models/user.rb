class User < ActiveRecord::Base
  has_many :course_to_users
  has_many :courses, through: :course_to_users
  has_many :submissions

  validates :user_email, presence: true
  validates :user_password, presence: true
  validates :user_name, presence: true
  validates :user_login_name, presence: true
  ##allow nil for course_id,
  #validates :course_id, presence: true
  validates_uniqueness_of :user_email
  validates_uniqueness_of :user_login_name

  def self.new_student(user_params)
    user_params[:user_role] = 'student' 
    return self.new(user_params)
  end

  def self.get_user(loginname_or_email)
    user = User.find_by user_login_name: loginname_or_email
    if user == nil
      return User.find_by user_email: loginname_or_email  
    else
      return user
    end
  end

  def authenticate(password)
    if self.user_password == password
      return true
    else
      return false
    end
  end

  def get_submissions(courseID, homeworkID)
    Submission.where(user_id: self.id).where(course_id: courseID).where(homework_id: homeworkID)
  end

  def get_homeworks_by_course(courseID)
    self.courses.find(courseID).homeworks
  end
  
  def get_homeworks
    homework = {}
    self.courses.each do |c|
      puts c.id
      homework[c.id] = self.get_homeworks_by_course(c.id)
    end
    return homework
  end
end
