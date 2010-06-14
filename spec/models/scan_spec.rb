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
    os.matches = [
                  OpenStruct.new({
                                   :inner_html => '<a href="something.com"></a>',
                                   :adserver   => 'foo.com',
                                   :link_url   => 'something.com',
                                   :url        => 'http://smashingmagazine.com/',
                                   :page_md5   => '912ec803b2ce49e4a541068d495ab570',
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
  end
end
