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

ActiveRecord::Schema.define(version: 20170312122151) do

  create_table "records", force: :cascade do |t|
    t.string   "drc_id"
    t.string   "collection"
    t.string   "author"
    t.string   "location"
    t.string   "year"
    t.string   "date"
    t.string   "date_digitized"
    t.string   "date_issued"
    t.string   "description_html"
    t.string   "description_notes"
    t.string   "recording_format"
    t.string   "length"
    t.string   "drc_link"
    t.string   "language"
    t.string   "institution_repo"
    t.string   "institution_digital"
    t.string   "is_part_of"
    t.string   "series"
    t.string   "rights_uri"
    t.string   "rights"
    t.string   "subject"
    t.string   "subject_two"
    t.string   "subject_three"
    t.string   "title_alternitive"
    t.string   "title_text"
    t.string   "recording_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
