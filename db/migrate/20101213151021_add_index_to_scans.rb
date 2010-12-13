class AddIndexToScans < ActiveRecord::Migration
  def self.up
    add_index :scans, [:updated_at, :domain_id, :path], { :name => "scans_index", :unique => true }
  end

  def self.down
    remove_index :scans, "scans_index"
  end
end
