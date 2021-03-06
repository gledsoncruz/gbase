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

ActiveRecord::Schema.define(version: 20150311204846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gbase_menus", force: true do |t|
    t.string   "nome",       limit: 80,  null: false
    t.string   "descricao",  limit: 120, null: false
    t.string   "link",       limit: 30,  null: false
    t.integer  "modulo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icone",      limit: 40
  end

  add_index "gbase_menus", ["descricao"], name: "index_gbase_menus_on_descricao", using: :btree

  create_table "gbase_modulos", force: true do |t|
    t.string   "name",       limit: 80,  null: false
    t.string   "descricao",  limit: 120, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gbase_modulos", ["name"], name: "index_gbase_modulos_on_name", using: :btree

  create_table "gbase_permissions", primary_key: "user_id", force: true do |t|
    t.integer  "modulo_id",  null: false
    t.integer  "menu_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "listar"
    t.boolean  "criar"
    t.boolean  "alterar"
    t.boolean  "apagar"
  end

  create_table "gbase_users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 80,              null: false
    t.integer  "role",                                           null: false
    t.boolean  "approved"
  end

  add_index "gbase_users", ["email"], name: "index_gbase_users_on_email", unique: true, using: :btree
  add_index "gbase_users", ["reset_password_token"], name: "index_gbase_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  Foreigner.load
  add_foreign_key "gbase_menus", "gbase_modulos", name: "gbase_menus_gbase_modulo_id_fk", column: "modulo_id"

  add_foreign_key "gbase_permissions", "gbase_menus", name: "gbase_permissions_gbase_menu_id_fk", column: "menu_id"
  add_foreign_key "gbase_permissions", "gbase_modulos", name: "gbase_permissions_gbase_modulo_id_fk", column: "modulo_id"
  add_foreign_key "gbase_permissions", "gbase_users", name: "gbase_permissions_gbase_user_id_fk", column: "user_id"

end
