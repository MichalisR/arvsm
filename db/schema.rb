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

ActiveRecord::Schema.define(version: 20160626132313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.string   "description"
    t.datetime "starting_date"
    t.datetime "end_date"
    t.string   "absence_type"
    t.string   "status"
    t.string   "comment"
    t.integer  "no_days"
    t.integer  "approver_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "aprrover_id"
  end

  add_index "requests", ["aprrover_id"], name: "index_requests_on_aprrover_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "position"
    t.string   "password_digest"
    t.boolean  "is_manager"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "requests", "users"
end
