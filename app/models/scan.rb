class Scan < ActiveRecord::Base
  has_many :ads
  has_one :screenshot

  accepts_nested_attributes_for :ads, :screenshot

  def self.from_open_struct(os)
    attrs = os.marshal_dump
    ads = (attrs.delete(:matches) || []).map(&:marshal_dump)
    data = attrs.delete(:screenshot)
    attrs.merge!({:screenshot_attributes => {:data => data}}) if data
    new attrs.merge({:ads_attributes => ads})
  end
end
