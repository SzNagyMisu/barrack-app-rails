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

ActiveRecord::Schema[7.0].define(version: 2023_05_17_104436) do
  create_table "balances", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_balances_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.integer "gender", limit: 1
    t.integer "height_in_cm"
    t.integer "weight_in_kg"
    t.string "phone"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_session_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "training_session_id", null: false
    t.integer "state", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_session_id"], name: "index_training_session_users_on_training_session_id"
    t.index ["user_id"], name: "index_training_session_users_on_user_id"
  end

  create_table "training_sessions", force: :cascade do |t|
    t.string "code"
    t.datetime "start_time"
    t.integer "trainer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_training_sessions_on_trainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "balances", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "training_session_users", "training_sessions"
  add_foreign_key "training_session_users", "users"
  add_foreign_key "training_sessions", "trainers"
end
