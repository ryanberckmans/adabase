class AddScreenshotHeightToAds < ActiveRecord::Migration
  def self.up
    add_column :ads, :screenshot_height, :float
  end

  def self.down
    remove_column :ads, :screenshot_height
  end
end
