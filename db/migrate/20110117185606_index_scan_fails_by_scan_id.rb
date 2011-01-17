class IndexScanFailsByScanId < ActiveRecord::Migration
  def self.up
    add_index :scan_fails, :scan_id, { :unique => true }
  end

  def self.down
    remove_index :scan_fails, :scan_id
  end
end
