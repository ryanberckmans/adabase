class AddScanTimeToScans < ActiveRecord::Migration
  def self.up
    now = Time.now
    change_table :scans do |t|
      t.datetime :scan_time, :default => now
    end
  end

  def self.down
    remove_column :scans, :scan_time
  end
end
