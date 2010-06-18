class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.integer :scan_id
      t.string :url
      t.string :link_url
      t.string :target_url
      t.string :adserver        # this can possibly become adserver_id
      t.string :page_md5, :limit => 32
      t.text :inner_html

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
