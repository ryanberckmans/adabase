class AddScanTimeToScans < ActiveRecord::Migration
  def self.up
    add_column :scans, :scan_time, :datetime
  end

  def self.down
    remove_column :scans, :scan_time
  end
end
