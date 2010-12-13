class IndexAdsByScanId < ActiveRecord::Migration
  def self.up
    add_index :ads, :scan_id
  end

  def self.down
    remove_index :ads, :scan_id
  end
end
