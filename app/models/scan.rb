class Scan < ActiveRecord::Base
  def self.from_open_struct(os)
    new os.marshal_dump
  end
end
