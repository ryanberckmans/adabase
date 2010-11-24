class ScanFail < ActiveRecord::Base
  belongs_to :scan
  validates_presence_of :message, :backtrace
end
