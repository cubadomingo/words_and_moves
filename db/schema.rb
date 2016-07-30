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

ActiveRecord::Schema.define(version: 20160730034547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "subregion_id"
    t.index ["subregion_id"], name: "index_cities_on_subregion_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string  "body"
    t.integer "user_id"
    t.integer "event_id"
    t.integer "post_id"
    t.index ["event_id"], name: "index_comments_on_event_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "location"
    t.datetime "event_date"
    t.integer  "category_id"
    t.integer  "city_id"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["city_id"], name: "index_events_on_city_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string  "title"
    t.text    "body"
    t.integer "category_id"
    t.integer "region_id"
    t.index ["category_id"], name: "index_posts_on_category_id", using: :btree
    t.index ["region_id"], name: "index_posts_on_region_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id", using: :btree
    t.index ["user_id"], name: "index_rsvps_on_user_id", using: :btree
  end

  create_table "subregions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "region_id"
    t.index ["region_id"], name: "index_subregions_on_region_id", using: :btree
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_city_relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_user_city_relations_on_city_id", using: :btree
    t.index ["user_id"], name: "index_user_city_relations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cities", "subregions"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "cities"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "regions"
  add_foreign_key "subregions", "regions"
  add_foreign_key "user_city_relations", "cities"
  add_foreign_key "user_city_relations", "users"
end
