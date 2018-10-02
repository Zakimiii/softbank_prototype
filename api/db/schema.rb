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

ActiveRecord::Schema.define(version: 20180826230215) do

  create_table "agreements", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "span",        limit: 255,   default: ""
    t.boolean  "regular"
    t.boolean  "direct"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",            limit: 255,   default: ""
    t.text     "profileImage",    limit: 65535
    t.text     "backgroundImage", limit: 65535
    t.string   "description",     limit: 255,   default: ""
    t.string   "website",         limit: 255,   default: ""
    t.string   "phoneNumber",     limit: 255,   default: ""
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "company_contents", force: :cascade do |t|
    t.text     "title",       limit: 65535, null: false
    t.text     "description", limit: 65535, null: false
    t.text     "article",     limit: 65535
    t.integer  "company_id",  limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "company_contents", ["company_id"], name: "fk_rails_39ff4b767b", using: :btree

  create_table "contents", force: :cascade do |t|
    t.integer  "contentable_id",   limit: 4
    t.string   "contentable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "contents", ["contentable_id", "contentable_type"], name: "index_contents_on_contentable_id_and_contentable_type", using: :btree

  create_table "fieldings", force: :cascade do |t|
    t.integer  "contentable_id",   limit: 4
    t.string   "contentable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "field_id",         limit: 4,   null: false
  end

  add_index "fieldings", ["contentable_id", "contentable_type"], name: "index_fieldings_on_contentable_id_and_contentable_type", using: :btree
  add_index "fieldings", ["field_id"], name: "index_fieldings_on_field_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "group_contents", force: :cascade do |t|
    t.text     "title",       limit: 65535, null: false
    t.text     "description", limit: 65535, null: false
    t.text     "article",     limit: 65535
    t.integer  "group_id",    limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "group_contents", ["group_id"], name: "fk_rails_8c19f4ae97", using: :btree

  create_table "group_messages", force: :cascade do |t|
    t.text     "text",       limit: 65535, null: false
    t.text     "image",      limit: 65535
    t.integer  "group_id",   limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "group_messages", ["group_id"], name: "fk_rails_eb52036374", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",            limit: 255,   default: ""
    t.text     "profileImage",    limit: 65535
    t.text     "backgroundImage", limit: 65535
    t.string   "description",     limit: 255,   default: ""
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "user_contents", force: :cascade do |t|
    t.text     "title",       limit: 65535, null: false
    t.text     "description", limit: 65535, null: false
    t.text     "article",     limit: 65535
    t.integer  "user_id",     limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_contents", ["user_id"], name: "fk_rails_1b2d7668e7", using: :btree

  create_table "user_messages", force: :cascade do |t|
    t.text     "text",        limit: 65535, null: false
    t.text     "image",       limit: 65535
    t.integer  "fromUser_id", limit: 4,     null: false
    t.integer  "toUser_id",   limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_messages", ["fromUser_id", "toUser_id"], name: "index_user_messages_on_fromUser_id_and_toUser_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uuid",                   limit: 255,   default: ""
    t.text     "profileImage",           limit: 65535
    t.text     "backgroundImage",        limit: 65535
    t.string   "firstNameZenkaku",       limit: 255,   default: ""
    t.string   "firstNameKana",          limit: 255,   default: ""
    t.string   "lastNameZenkaku",        limit: 255,   default: ""
    t.string   "lastNameKana",           limit: 255,   default: ""
    t.string   "fullName",               limit: 255,   default: ""
    t.string   "name",                   limit: 255,   default: ""
    t.string   "nickname",               limit: 255,   default: ""
    t.string   "phoneNumber",            limit: 255
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,     default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "company_contents", "companies"
  add_foreign_key "group_contents", "groups"
  add_foreign_key "group_messages", "groups"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "user_contents", "users"
end
