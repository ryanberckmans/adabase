class AddPageWidthToScans < ActiveRecord::Migration
  def self.up
    add_column :scans, :page_width, :integer
  end

  def self.down
    remove_column :scans, :page_width
  end
end
