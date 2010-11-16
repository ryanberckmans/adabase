class AddTitleToScans < ActiveRecord::Migration
  def self.up
    add_column :scans, :title, :string
  end

  def self.down
    remove_column :scans, :title
  end
end
