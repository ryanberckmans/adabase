class AddPageHeightToScans < ActiveRecord::Migration
  def self.up
    add_column :scans, :page_height, :integer
  end

  def self.down
    remove_column :scans, :page_height
  end
end
