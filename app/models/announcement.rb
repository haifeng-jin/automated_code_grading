class Announcement < ActiveRecord::Base
  belongs_to :course, :validate => true
  validates :course, :presence => true

end
