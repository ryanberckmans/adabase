class AddFormatToAds < ActiveRecord::Migration
  def self.up
    add_column :ads, :format, :string
  end

  def self.down
    remove_column :ads, :format
  end
end
