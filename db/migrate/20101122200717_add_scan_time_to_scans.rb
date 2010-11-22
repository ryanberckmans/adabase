class AddScanTimeToScans < ActiveRecord::Migration
  def self.up
    add_column :scans, :scan_time, :datetime
    now = Time.now
    Scan.update_all ["scan_time = ?", now]
  end

  def self.down
    remove_column :scans, :scan_time
  end
end
