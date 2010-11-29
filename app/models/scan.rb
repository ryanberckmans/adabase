class Scan < ActiveRecord::Base
  has_many :ads
  has_one :screenshot
  belongs_to :domain
  has_one :scan_fail

  accepts_nested_attributes_for :ads, :screenshot, :scan_fail

  validates_presence_of :domain, :path

  def self.schedule( domain, path )
    path = "/" unless path and path.length > 0
    scan = new({ :path => path, :domain => Domain.find_or_create_by_url( domain ) })
    raise "failed to save scheduled scan" unless scan.save
    scan.id
  end
  
  def self.attrs_from_open_struct(os)
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

    quantcast_rank = attrs.delete(:quantcast_rank)
    domain_url = attrs.delete(:domain)
    domain = Domain.find_by_url domain_url
    raise "scan domain not found" unless domain
    domain.quantcast_rank = quantcast_rank
    raise unless domain.save
    
    exception = attrs.delete :exception
    attrs.merge!({:scan_fail_attributes => { :backtrace => exception.backtrace, :message => exception.message } }) if exception
    
    data = attrs.delete(:screenshot)
    attrs.merge!({:screenshot_attributes => {:data => data}}) if data
    
    attrs.merge({:ads_attributes => ads, :domain => domain})
  end
end
