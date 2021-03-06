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

ActiveRecord::Schema.define(version: 20161102090406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "title"
    t.string   "attachment"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "position"
    t.boolean  "common",          default: false
  end

  create_table "blocks", force: :cascade do |t|
    t.string   "title"
    t.text     "info"
    t.string   "popup"
    t.date     "finish"
    t.integer  "customer_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
  end

  add_index "blocks", ["customer_id"], name: "index_blocks_on_customer_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.text     "about"
    t.text     "contacts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "coop"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "title"
    t.text     "info"
    t.string   "phone"
    t.string   "address"
    t.string   "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "till"
    t.integer  "block_id"
  end

  add_index "offers", ["block_id"], name: "index_offers_on_block_id", using: :btree

  create_table "schemes", force: :cascade do |t|
    t.string   "title"
    t.integer  "position"
    t.integer  "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schemes", ["block_id"], name: "index_schemes_on_block_id", using: :btree

  create_table "three_d_templates", force: :cascade do |t|
    t.string   "title"
    t.string   "script"
    t.integer  "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "three_d_templates", ["block_id"], name: "index_three_d_templates_on_block_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "schemes", "blocks"
  add_foreign_key "three_d_templates", "blocks"
end
