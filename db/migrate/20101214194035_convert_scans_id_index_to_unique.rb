class ConvertScansIdIndexToUnique < ActiveRecord::Migration
  def self.up
    remove_index :scans, :id
    add_index :scans, :id, { :unique => true }
  end

  def self.down
    remove_index :scans, :id
    add_index :scans, :id
  end
end
