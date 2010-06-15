class Screenshot < ActiveRecord::Base
  belongs_to :scan

  before_create :derive_s3_key_from_scan
  before_create  :persist_to_s3

  # a RightAws::S3::Bucket
  cattr_accessor :bucket

  # virtual attribute for raw data to be written to s3
  attr_accessor :data

  def derive_s3_key_from_scan
    raise "Screenshot must be associated with a saved Scan" unless (scan && scan.id)
    self[:s3_key] ||= "#{scan.id}.png"
  end

  def s3_key=(_new_key)
    derive_s3_key_from_scan
  end

  def s3_path
    s3_key && "#{Screenshot.bucket.name}/#{s3_key}"
  end

  def persist_to_s3
    Screenshot.bucket.put(s3_key, Base64.decode64(data), {}, nil, 'content-type' => 'image/png')
  end
end
