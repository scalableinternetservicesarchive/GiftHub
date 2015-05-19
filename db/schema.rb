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

ActiveRecord::Schema.define(version: 20150519020819) do

  create_table "campuses", force: :cascade do |t|
    t.string "name",         null: false
    t.string "email_domain", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "gallery_id", null: false
    t.integer "user_id",    null: false
    t.string  "value",      null: false
  end

  create_table "exchange_profiles", force: :cascade do |t|
    t.integer "user_id",               null: false
    t.integer "exchange_id",           null: false
    t.integer "exchange_profile_id"
    t.binary  "delivery_verification"
    t.boolean "gift_received",         null: false
    t.integer "wish_list_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string   "name"
    t.string   "thumburl"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "description"
    t.datetime "registration_start"
    t.datetime "registration_end"
    t.datetime "gift_due_date"
    t.integer  "campus_id"
    t.integer  "category_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string   "exchangeName"
    t.integer  "categoryID"
    t.string   "userEmail"
    t.string   "notes"
    t.string   "favorite"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.integer  "exchange_id", null: false
    t.integer  "user_id",     null: false
    t.string   "title",       null: false
    t.datetime "upload_date", null: false
  end

  create_table "input_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string  "value",       null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_file_name",    limit: 255
    t.string "image_content_type", limit: 255
  end

  create_table "questions", force: :cascade do |t|
    t.integer "exchange_id",   null: false
    t.string  "title",         null: false
    t.integer "input_type_id", null: false
  end

  create_table "response_values", force: :cascade do |t|
    t.integer "response_id", null: false
    t.string  "value",       null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "user_id",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wish_list_items", force: :cascade do |t|
    t.integer "wish_list_id", null: false
    t.string  "name",         null: false
  end

  create_table "wish_lists", force: :cascade do |t|
    t.string   "title",        null: false
    t.datetime "last_updated", null: false
  end

end
