class RemoveDomainFromScans < ActiveRecord::Migration
  def self.up
    remove_column :scans, :domain
  end

  def self.down
    add_column :scans, :domain, :string
  end
end
