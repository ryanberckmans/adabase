class AddIndividualIndexToScans < ActiveRecord::Migration
  def self.up
    remove_index :scans, :name => "scans_index"
    add_index :scans, :id
    add_index :scans, :updated_at
    add_index :scans, :domain_id
    add_index :scans, :path
  end

  def self.down
    remove_index :scans, :id
    remove_index :scans, :updated_at
    remove_index :scans, :domain_id
    remove_index :scans, :path
    add_index :scans, [:updated_at, :domain_id, :path], { :name => "scans_index", :unique => true }
  end
end
