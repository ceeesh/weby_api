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

ActiveRecord::Schema[7.0].define(version: 2023_06_14_161809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "token"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_role", default: "client"
    t.string "birthday"
    t.string "gender"
    t.string "phone_number"
    t.string "country"
  end

  create_table "devs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "email"
    t.string "password"
    t.string "token"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_role", default: "dev"
    t.index ["team_id"], name: "index_devs_on_team_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.boolean "is_read", default: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_notifications_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "client_id", null: false
    t.boolean "status", default: false
    t.integer "start_date"
    t.integer "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "duration"
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "price"
    t.boolean "status", default: false
    t.bigint "project_id", null: false
    t.integer "start_date"
    t.integer "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_transactions_on_project_id"
  end

  add_foreign_key "devs", "teams"
  add_foreign_key "notifications", "projects"
  add_foreign_key "projects", "clients"
  add_foreign_key "teams", "projects"
  add_foreign_key "transactions", "projects"
end
