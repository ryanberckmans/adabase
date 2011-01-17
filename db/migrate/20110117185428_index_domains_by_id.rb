class IndexDomainsById < ActiveRecord::Migration
  def self.up
    add_index :domains, :id, { :unique => true }
  end

  def self.down
    remove_index :domains, :id
  end
end
