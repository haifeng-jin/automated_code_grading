class CourseToUser < ActiveRecord::Base
  #:validate => true means :course must present
  belongs_to :course, :validate => true
  #means such course must be exists
  validates :course, :presence => true

  belongs_to :user, :validate => true
  validates :user, :presence => true
  validates_uniqueness_of :user, :scope => :course
end
