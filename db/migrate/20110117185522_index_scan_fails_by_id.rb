class IndexScanFailsById < ActiveRecord::Migration
  def self.up
    add_index :scan_fails, :id, { :unique => true }
  end

  def self.down
    remove_index :scan_fails, :id
  end
end
