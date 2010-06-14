class Scan < ActiveRecord::Base
  has_many :ads

  accepts_nested_attributes_for :ads

  def self.from_open_struct(os)
    attrs = os.marshal_dump
    ads = (attrs.delete(:matches) || []).map(&:marshal_dump)
    new attrs.merge({:ads_attributes => ads})
  end
end
