class Submission < ActiveRecord::Base
  belongs_to :homework, :validate => true
  validates :homework, :presence => true

  belongs_to :user, :validate => true
  validates :user, :presence => true

  belongs_to :course, :validate => true
  validates :course, :presence => true
end
