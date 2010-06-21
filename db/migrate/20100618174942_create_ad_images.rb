class CreateAdImages < ActiveRecord::Migration
  def self.up
    create_table :ad_images do |t|
      t.integer :ad_id
      t.string :s3_key
      t.integer :width
      t.integer :height
      t.integer :screen_xpos
      t.integer :screen_ypos

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_images
  end
end
