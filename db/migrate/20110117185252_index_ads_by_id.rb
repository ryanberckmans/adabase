class IndexAdsById < ActiveRecord::Migration
  def self.up
    add_index :ads, :id, { :unique => true }
  end

  def self.down
    remove_index :ads, :id
  end
end
