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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120528174219) do

  create_table "hitters", :force => true do |t|
    t.integer  "ab"
    t.integer  "h"
    t.integer  "dbl"
    t.integer  "trp"
    t.integer  "hr"
    t.integer  "r"
    t.integer  "rbi"
    t.integer  "sb"
    t.integer  "cs"
    t.integer  "g"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "player_id"
  end

  create_table "players", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "atbats",     :default => 0
    t.integer  "hits",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "league"
    t.string   "team"
    t.integer  "runs",       :default => 0
    t.integer  "rbi",        :default => 0
  end

end
