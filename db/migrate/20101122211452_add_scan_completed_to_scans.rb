class AddScanCompletedToScans < ActiveRecord::Migration
  def self.up
    change_table :scans do |t|
      t.boolean :scan_completed, :default => false
    end
    Scan.update_all ["scan_completed = ?", true]
  end

  def self.down
    remove_column :scans, :scan_completed
  end
end
