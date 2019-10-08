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

ActiveRecord::Schema.define(version: 2019_10_08_193432) do

  create_table "error_images", force: :cascade do |t|
    t.string "image"
    t.integer "error_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["error_id"], name: "index_error_images_on_error_id"
  end

  create_table "errors", force: :cascade do |t|
    t.text "want"
    t.text "timing"
    t.text "detail"
    t.text "challenge"
    t.string "article"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank", default: 1
    t.index ["member_id"], name: "index_errors_on_member_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "mentor_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_follows_on_member_id"
    t.index ["mentor_id"], name: "index_follows_on_mentor_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solution_images", force: :cascade do |t|
    t.string "image"
    t.integer "solution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solution_id"], name: "index_solution_images_on_solution_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "article"
    t.text "detail"
    t.integer "error_id"
    t.integer "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["error_id"], name: "index_solutions_on_error_id"
    t.index ["mentor_id"], name: "index_solutions_on_mentor_id"
  end

end
