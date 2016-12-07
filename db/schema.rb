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

ActiveRecord::Schema.define(version: 20161127113323) do

  create_table "calibration_settings", force: :cascade do |t|
    t.text     "calibration_values",     default: ""
    t.float    "paramA",                 default: 0.0
    t.float    "paramB",                 default: 0.0
    t.boolean  "calibration_calculated", default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.datetime "started_at"
    t.time     "gathering_time"
    t.date     "gathering_date"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "absolute_humidity"
    t.float    "air_humidity"
    t.float    "air_temperature"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string  "ip_address",              default: "10.0.0.3"
    t.integer "tcp_port",                default: 4000
    t.integer "ftp_port",                default: 5000
    t.integer "measurements_distance"
    t.integer "amount_of_measurementes"
    t.integer "amount_of_rows"
  end

end
