class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :user_email, presence: true
  validates :user_class, presence: true
  validates :user_password, presence: true
  validates :user_role, presence: true
end
