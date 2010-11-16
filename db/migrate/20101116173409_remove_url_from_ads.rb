class RemoveUrlFromAds < ActiveRecord::Migration
  def self.up
    remove_column :ads, :url
  end

  def self.down
    add_column :ads, :url, :string
  end
end
