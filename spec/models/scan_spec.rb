require 'spec_helper'

describe Scan, "OpenStruct support" do
  def basic_os
    OpenStruct.new({
                     :html   => '<html><head><title>smashing</title></head><body></body></html>',
                     :domain => 'http://smashingmagazine.com',
                     :url    => 'http://smashingmagazine.com/',
                     :path   => '/',
                   })
  end

  def complex_os
    os = basic_os
    os.ads = [
                  OpenStruct.new({
                                   :inner_html => '<a href="something.com"></a>',
                                   :adserver   => 'foo.com',
                                   :link_url   => 'something.com',
                                   :url        => 'http://smashingmagazine.com/',
                                   :screenshot_info => OpenStruct.new({
                                     :left =>   1,
                                     :top =>    2,
                                     :width =>  3,
                                     :height => 4,
                                                                      }),
                                   :target_url => 'bar.com',
                                 }),
                 ]
    os
  end

  it "can be created from a basic OpenStruct" do
    s = Scan.from_open_struct basic_os
    s.save.should be_true
  end

  it "can be created from an OpenStruct with nested ads" do
    s = Scan.from_open_struct complex_os
    s.save.should be_true
    s.ads.size.should == 1

    s.ads.first.target_url.should == 'bar.com'

    ad_image = s.ads.first.ad_image
    ad_image.should_not be_nil
    ad_image.screen_xpos.should == complex_os.ads.first.screenshot_info.left
    ad_image.screen_ypos.should == complex_os.ads.first.screenshot_info.top
    ad_image.width.should == complex_os.ads.first.screenshot_info.width
    ad_image.height.should == complex_os.ads.first.screenshot_info.height
  end

  it "can save associated screenshot" do
    data = 'raw screenshot data'

    Screenshot.bucket = RightAws::S3::Bucket.new('s3_obj','bucket_name')
    stub(Screenshot.bucket).put

    os = basic_os
    os.screenshot = Base64.encode64(data)

    s = Scan.from_open_struct os
    s.save.should be_true
    s.screenshot.should_not be_nil

    # there's a nicer way to do this verification but I can't remember
    # what it is and the RR docs are currently out of date
    recipient, method, args = *RR::Space.instance.recorded_calls.recorded_calls.first
    recipient.should == Screenshot.bucket
    method.should == :put
    args.should == ["#{s.id}.png", data, {}, nil, {'content-type' => 'image/png'}]
  end

  it "shouldn't save associated screenshot if s3 persist fails" do
    data = 'raw screenshot data'

    Screenshot.bucket = RightAws::S3::Bucket.new('s3_obj','bucket_name')
    stub(Screenshot.bucket).put { false }

    os = basic_os
    os.screenshot = Base64.encode64(data)

    s = Scan.from_open_struct os
    s.save.should be_false
  end
end
