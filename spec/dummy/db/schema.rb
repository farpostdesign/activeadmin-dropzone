# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150121233351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feror_gallery_albums", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "viewed",               default: 0
    t.integer  "photos_count",         default: 0
    t.integer  "position",             default: 0
    t.boolean  "visible",              default: true
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feror_gallery_albums", ["position"], name: "index_feror_gallery_albums_on_position", using: :btree
  add_index "feror_gallery_albums", ["slug"], name: "index_feror_gallery_albums_on_slug", using: :btree
  add_index "feror_gallery_albums", ["title"], name: "index_feror_gallery_albums_on_title", using: :btree

  create_table "feror_gallery_photos", force: :cascade do |t|
    t.integer  "album_id"
    t.string   "title"
    t.integer  "position"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feror_gallery_photos", ["album_id"], name: "index_feror_gallery_photos_on_album_id", using: :btree
  add_index "feror_gallery_photos", ["position"], name: "index_feror_gallery_photos_on_position", using: :btree

end
