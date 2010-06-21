class Ad < ActiveRecord::Base
  belongs_to :scan
  has_one :ad_image

  accepts_nested_attributes_for :ad_image
end
