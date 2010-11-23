class RemoveUrlFromScans < ActiveRecord::Migration
  def self.up
    remove_column :scans, :url
  end

  def self.down
    add_column :scans, :url, :string
  end
end
