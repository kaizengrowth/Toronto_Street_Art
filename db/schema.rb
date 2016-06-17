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

ActiveRecord::Schema.define(version: 20160617043222) do

  create_table "intersections", force: :cascade do |t|
    t.string "street1", null: false
    t.string "street2", null: false
  end

  add_index "intersections", ["street1"], name: "index_intersections_on_street1"
  add_index "intersections", ["street2"], name: "index_intersections_on_street2"

  create_table "pictures", force: :cascade do |t|
    t.string   "intersection_id", null: false
    t.string   "user_id",         null: false
    t.string   "img_url",         null: false
    t.string   "artist_name"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["artist_name"], name: "index_pictures_on_artist_name"
  add_index "pictures", ["intersection_id"], name: "index_pictures_on_intersection_id"
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "login_token"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
