class CreateScans < ActiveRecord::Migration
  def self.up
    create_table :scans do |t|
      t.string :url
      t.string :domain
      t.string :path
      t.text :html

      t.timestamps
    end
  end

  def self.down
    drop_table :scans
  end
end
