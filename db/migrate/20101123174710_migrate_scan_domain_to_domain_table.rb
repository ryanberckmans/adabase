class MigrateScanDomainToDomainTable < ActiveRecord::Migration
  def self.up
    Scan.find(:all).each do |scan|
      Domain.find(:first, :conditions => [ "url = ?", scan.url ] ) do |d|
        scan.domain = d
        scan.save
      end
    end
  end

  def self.down
  end
end
