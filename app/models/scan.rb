class Scan < ActiveRecord::Base
  has_many :ads
  has_one :screenshot

  accepts_nested_attributes_for :ads, :screenshot

  def self.from_open_struct(os)
    attrs = os.marshal_dump
    ads = (attrs.delete(:ads) || []).map(&:marshal_dump)
    ads.each do |ad|
      ad.delete(:element_type)
      target = ad.delete(:target_location)
      ad[:target_url] = target unless target.blank?
      screenshot_info = ad.delete(:screenshot_info)
      if screenshot_info
        ad_image = screenshot_info.marshal_dump
        xpos = ad_image.delete(:left)
        ad_image[:screen_xpos] = xpos if xpos
        ypos = ad_image.delete(:top)
        ad_image[:screen_ypos] = ypos if ypos
        ad[:ad_image_attributes] = ad_image
      end
    end
    attrs.delete(:date)
    attrs.delete(:quantcast_rank)
    data = attrs.delete(:screenshot)
    attrs.merge!({:screenshot_attributes => {:data => data}}) if data
    new attrs.merge({:ads_attributes => ads})
  end
end
