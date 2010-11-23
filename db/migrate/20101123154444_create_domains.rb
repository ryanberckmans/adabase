class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :url
      t.integer :quantcast_rank

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
