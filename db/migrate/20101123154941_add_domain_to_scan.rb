class AddDomainToScan < ActiveRecord::Migration
  def self.up
    add_column :scans, :domain_id, :integer
  end

  def self.down
    remove_column :scans, :domain_id
  end
end
