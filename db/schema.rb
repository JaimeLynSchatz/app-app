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

ActiveRecord::Schema.define(version: 20130913161730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",            default: "applicant"
    t.string   "nickname"
    t.string   "uid"
    t.string   "avatar_url"
    t.string   "phone"
    t.string   "street"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.boolean  "locked",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["uid"], name: "index_people_on_uid", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "submission_id"
    t.integer  "person_id"
    t.integer  "score"
    t.boolean  "complete",                default: false
    t.text     "feedback"
    t.string   "suggested_for_interview"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.string   "resume_url"
    t.string   "video_interview_url"
    t.string   "twitter_handle"
    t.string   "website_url"
    t.string   "linkdin_url"
    t.string   "status",                   default: "pending"
    t.text     "sponsorship_explaination"
    t.boolean  "wa_resident",              default: false
    t.boolean  "wa_student",               default: false
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reading_assessment_url"
    t.string   "logic_assessment_url"
    t.boolean  "us_citizen",               default: false
    t.string   "financial_position"
  end

end
