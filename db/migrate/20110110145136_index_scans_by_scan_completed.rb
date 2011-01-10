class IndexScansByScanCompleted < ActiveRecord::Migration
  def self.up
    add_index :scans, :scan_completed
  end

  def self.down
    remove_index :scans, :scan_completed
  end
end
