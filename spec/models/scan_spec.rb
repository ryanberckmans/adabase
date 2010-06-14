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

  it "can be created from a basic OpenStruct" do
    s = Scan.from_open_struct basic_os
    s.save.should be_true
  end
end
