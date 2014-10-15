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

ActiveRecord::Schema.define(version: 20141015213729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: true do |t|
    t.integer  "bill_id"
    t.string   "date"
    t.string   "action"
    t.string   "actor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actions", ["bill_id"], name: "index_actions_on_bill_id", using: :btree

  create_table "bills", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_id"
    t.string   "state"
    t.string   "title"
    t.string   "bill_type"
    t.datetime "external_updated_at"
  end

  create_table "legislators", force: true do |t|
    t.string   "external_id"
    t.string   "district"
    t.string   "party"
    t.string   "email"
    t.string   "photo_url"
    t.string   "url"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "no_votes", force: true do |t|
    t.integer  "vote_id"
    t.string   "leg_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "no_votes", ["vote_id"], name: "index_no_votes_on_vote_id", using: :btree

  create_table "other_votes", force: true do |t|
    t.integer  "vote_id"
    t.string   "leg_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "other_votes", ["vote_id"], name: "index_other_votes_on_vote_id", using: :btree

  create_table "user_legislators", force: true do |t|
    t.integer  "user_id"
    t.integer  "legislator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_legislators", ["legislator_id"], name: "index_user_legislators_on_legislator_id", using: :btree
  add_index "user_legislators", ["user_id"], name: "index_user_legislators_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "district"
    t.string   "email"
  end

  create_table "votes", force: true do |t|
    t.integer  "bill_id"
    t.text     "motion"
    t.string   "chamber"
    t.string   "date"
    t.string   "external_id"
    t.string   "yes_count"
    t.string   "no_count"
    t.string   "other_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["bill_id"], name: "index_votes_on_bill_id", using: :btree

  create_table "yes_votes", force: true do |t|
    t.string   "leg_id"
    t.integer  "vote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yes_votes", ["vote_id"], name: "index_yes_votes_on_vote_id", using: :btree

end
