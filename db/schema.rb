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

ActiveRecord::Schema.define(version: 20151021212513) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "homework_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assignments", ["course_id"], name: "index_assignments_on_course_id"
  add_index "assignments", ["homework_id"], name: "index_assignments_on_homework_id"

  create_table "course_to_users", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_to_users", ["course_id"], name: "index_course_to_users_on_course_id"
  add_index "course_to_users", ["user_id"], name: "index_course_to_users_on_user_id"

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.string   "hw_name"
    t.text     "hw_description"
    t.datetime "hw_release_date"
    t.datetime "hw_due_date"
    t.string   "hw_test_case_dir"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_email"
    t.string   "user_password"
    t.string   "user_role"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
