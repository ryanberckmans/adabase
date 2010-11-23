class Domain < ActiveRecord::Base
  has_many :scans
  validates_presence_of :url
  validates_uniqueness_of :url, :case_sensitive => false
end
