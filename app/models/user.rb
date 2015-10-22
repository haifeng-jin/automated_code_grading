class User < ActiveRecord::Base
  has_many :course_to_users
  has_many :courses, through: :course_to_users
  has_many :submissions

  validates :user_email, presence: true
  validates :user_password, presence: true
  validates :user_name, presence: true
  ##allow nil for course_id,
  #validates :course_id, presence: true
  validates_uniqueness_of :user_email

  def self.new_student(user_params)
    user_params[:user_role] = 'student' 
    return self.new(user_params)
  end

  def authenticate(password)
    if self.user_password == password
      return true
    else
      return false
    end
  end
end
