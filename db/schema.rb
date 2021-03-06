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

ActiveRecord::Schema.define(version: 20160718175019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "date_and_ranges", force: :cascade do |t|
    t.date     "start_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "name",       default: "DateAndRange"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "discussion_topics", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "event_id"
    t.uuid     "user_id",    default: -> { "uuid_generate_v4()" }
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "name"
    t.datetime "start_time"
    t.integer  "city_id"
    t.uuid     "user_id",    default: -> { "uuid_generate_v4()" }
    t.integer  "topic_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "end_time"
    t.index ["city_id"], name: "index_events_on_city_id", using: :btree
    t.index ["topic_id"], name: "index_events_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "filters", force: :cascade do |t|
    t.uuid     "user_id",    default: -> { "uuid_generate_v4()" }, null: false
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["owner_id", "owner_type"], name: "index_filters_on_owner_id_and_owner_type", using: :btree
    t.index ["user_id"], name: "index_filters_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_events", force: :cascade do |t|
    t.integer  "event_id",                                         null: false
    t.uuid     "user_id",    default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["event_id"], name: "index_users_events_on_event_id", using: :btree
    t.index ["user_id"], name: "index_users_events_on_user_id", using: :btree
  end

end
