class CourseToHomework < ActiveRecord::Base
  belongs_to :course, :validate => true
  validates :course, :presence => true

  belongs_to :homework, :validate => true
  validates :homework, :presence => true

  validates_uniqueness_of :course, :scope => :homework
end
