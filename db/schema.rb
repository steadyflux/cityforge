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

ActiveRecord::Schema.define(version: 20130824165027) do

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "education"
    t.integer  "authority"
    t.integer  "magic"
    t.integer  "military"
    t.integer  "tolerance"
    t.integer  "economy"
    t.integer  "moral"
    t.integer  "order"
    t.string   "size"
    t.integer  "population_estimate"
    t.integer  "size_modifier"
    t.integer  "min_density"
    t.integer  "max_density"
  end

end
