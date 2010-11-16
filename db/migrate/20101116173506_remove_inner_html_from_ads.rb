class RemoveInnerHtmlFromAds < ActiveRecord::Migration
  def self.up
    remove_column :ads, :inner_html
  end

  def self.down
    add_column :ads, :inner_html, :text
  end
end
