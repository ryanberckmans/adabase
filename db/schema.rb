# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100621163057) do

  create_table "ad_images", :force => true do |t|
    t.integer  "ad_id"
    t.string   "s3_key"
    t.integer  "width"
    t.integer  "height"
    t.integer  "screen_xpos"
    t.integer  "screen_ypos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", :force => true do |t|
    t.integer  "scan_id"
    t.string   "url"
    t.string   "link_url"
    t.string   "target_url"
    t.string   "adserver"
    t.text     "inner_html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scans", :force => true do |t|
    t.string   "url"
    t.string   "domain"
    t.string   "path"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenshots", :force => true do |t|
    t.integer  "scan_id"
    t.string   "s3_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
