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

ActiveRecord::Schema.define(version: 20180328013108) do

  create_table "tvlistings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tvlistings_on_user_id"
  end

  create_table "tvshows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "showtitle"
    t.bigint "user_id"
    t.time "show_length"
    t.integer "dow"
    t.time "show_start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "show_length_int"
    t.bigint "tvlisting_id"
    t.index ["tvlisting_id"], name: "index_tvshows_on_tvlisting_id"
    t.index ["user_id"], name: "index_tvshows_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tvlistings", "users"
  add_foreign_key "tvshows", "tvlistings"
  add_foreign_key "tvshows", "users"
end
