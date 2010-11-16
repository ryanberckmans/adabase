class RemoveAdserverFromAds < ActiveRecord::Migration
  def self.up
    remove_column :ads, :adserver
  end

  def self.down
    add_column :ads, :adserver, :string
  end
end
