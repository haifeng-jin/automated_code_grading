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

ActiveRecord::Schema.define(version: 20151016004228) do

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "homeworks", force: :cascade do |t|
    t.string   "hw_name"
    t.integer  "user_id"
    t.text     "hw_description"
    t.datetime "hw_release_date"
    t.datetime "hw_due_date"
    t.string   "hw_test_case_dir"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "homeworks", ["user_id"], name: "index_homeworks_on_user_id"

  create_table "submissions", force: :cascade do |t|
    t.integer  "homework_id"
    t.integer  "user_id"
    t.integer  "sm_grade"
    t.datetime "sm_date"
    t.string   "sm_src_code_dir"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "submissions", ["homework_id"], name: "index_submissions_on_homework_id"
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_email"
    t.string   "user_password"
    t.string   "user_name"
    t.string   "user_role"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["course_id"], name: "index_users_on_course_id"

end
