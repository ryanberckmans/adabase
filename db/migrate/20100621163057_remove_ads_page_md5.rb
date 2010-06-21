class RemoveAdsPageMd5 < ActiveRecord::Migration
  def self.up
    remove_column :ads, :page_md5
  end

  def self.down
    add_column :ads, :page_md5, :string, :length => 32
  end
end
