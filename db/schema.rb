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

ActiveRecord::Schema.define(version: 20171010085608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "pro_id"
    t.bigint "user_id"
    t.bigint "mission_id"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status", default: "pending"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_bookings_on_mission_id"
    t.index ["pro_id"], name: "index_bookings_on_pro_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "business_hours", force: :cascade do |t|
    t.bigint "pro_id"
    t.date "date"
    t.integer "week_day"
    t.time "start_time"
    t.time "end_time"
    t.boolean "open", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["open"], name: "index_business_hours_on_open"
    t.index ["pro_id"], name: "index_business_hours_on_pro_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "sender_type"
    t.bigint "sender_id"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_type", "recipient_id"], name: "index_conversations_on_recipient_type_and_recipient_id"
    t.index ["sender_type", "sender_id"], name: "index_conversations_on_sender_type_and_sender_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "sender_type"
    t.bigint "sender_id"
    t.bigint "conversation_id"
    t.text "body"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["sender_type", "sender_id"], name: "index_messages_on_sender_type_and_sender_id"
  end

  create_table "missions", force: :cascade do |t|
    t.integer "parent_id"
    t.bigint "pro_id"
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.integer "duration"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_id"], name: "index_missions_on_pro_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "object_type"
    t.bigint "object_id"
    t.string "photo"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_type", "object_id"], name: "index_photos_on_object_type_and_object_id"
  end

  create_table "pros", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.text "tokens"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "access_token"
    t.string "refresh_token"
    t.integer "calendar_id"
    t.index ["confirmation_token"], name: "index_pros_on_confirmation_token", unique: true
    t.index ["email"], name: "index_pros_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pros_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_pros_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_pros_on_unlock_token", unique: true
  end

  create_table "unavailabilities", force: :cascade do |t|
    t.bigint "pro_id"
    t.datetime "date"
    t.integer "week_day"
    t.text "hours", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_id"], name: "index_unavailabilities_on_pro_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "avatar"
    t.boolean "male"
    t.text "description"
    t.date "birth_date"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "missions"
  add_foreign_key "bookings", "pros"
  add_foreign_key "bookings", "users"
  add_foreign_key "business_hours", "pros"
  add_foreign_key "messages", "conversations"
  add_foreign_key "missions", "pros"
  add_foreign_key "unavailabilities", "pros"
end
