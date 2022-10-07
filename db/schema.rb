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

ActiveRecord::Schema[7.0].define(version: 2022_10_06_163908) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "frames", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "status", null: false
    t.integer "stock", null: false
    t.decimal "price", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "price > 0::numeric", name: "price_non_negative_or_zero"
  end

  create_table "glasses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "frame_id", null: false
    t.bigint "lens_id", null: false
    t.decimal "lens_amount", precision: 5, scale: 2, null: false
    t.decimal "frames_amount", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_id"], name: "index_glasses_on_frame_id"
    t.index ["lens_id"], name: "index_glasses_on_lens_id"
    t.index ["user_id"], name: "index_glasses_on_user_id"
  end

  create_table "lenses", force: :cascade do |t|
    t.string "color", null: false
    t.text "description", null: false
    t.integer "prescription_type", null: false
    t.integer "stock", null: false
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "lens_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "price > 0::numeric", name: "price_non_negative_or_zero"
  end

  create_table "user_carts", force: :cascade do |t|
    t.bigint "glass_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["glass_id"], name: "index_user_carts_on_glass_id"
    t.index ["user_id"], name: "index_user_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "admins", "users"
  add_foreign_key "glasses", "frames"
  add_foreign_key "glasses", "lenses"
  add_foreign_key "glasses", "users"
  add_foreign_key "user_carts", "glasses"
  add_foreign_key "user_carts", "users"
end
