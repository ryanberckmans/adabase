class AddScreenshotWidthToAds < ActiveRecord::Migration
  def self.up
    add_column :ads, :screenshot_width, :float
  end

  def self.down
    remove_column :ads, :screenshot_width
  end
end
