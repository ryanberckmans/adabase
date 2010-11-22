class AddScanCompletedToScans < ActiveRecord::Migration
  def self.up
    change_table :scans do |t|
      t.boolean :scan_completed, :default => true
    end
  end

  def self.down
    remove_column :scans, :scan_completed
  end
end
