class CreateScanFails < ActiveRecord::Migration
  def self.up
    create_table :scan_fails do |t|
      t.integer :scan_id
      t.text :backtrace
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :scan_fails
  end
end
