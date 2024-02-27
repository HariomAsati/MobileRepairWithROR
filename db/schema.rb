# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_27_125111) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "mobile_problem_lists", force: :cascade do |t|
    t.integer "mobile_id"
    t.integer "problem_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile_id"], name: "index_mobile_problem_lists_on_mobile_id"
    t.index ["problem_list_id"], name: "index_mobile_problem_lists_on_problem_list_id"
  end

  create_table "mobiles", force: :cascade do |t|
    t.string "imei"
    t.string "model"
    t.string "brand"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["profile_id"], name: "index_mobiles_on_profile_id"
  end

  create_table "otps", force: :cascade do |t|
    t.string "email"
    t.string "otp"
    t.datetime "expiry_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problem_lists", force: :cascade do |t|
    t.string "p_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.string "phonenumber"
    t.string "state"
    t.string "city"
    t.string "address"
    t.string "gender"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.boolean "verified"
  end

  create_table "shops", force: :cascade do |t|
    t.string "s_name"
    t.string "s_username"
    t.string "password_digest"
    t.string "state"
    t.string "district"
    t.string "city"
    t.string "address"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_shops_on_profile_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "mobile_problem_lists", "mobiles"
  add_foreign_key "mobile_problem_lists", "problem_lists"
  add_foreign_key "mobiles", "profiles"
  add_foreign_key "shops", "profiles"
end
