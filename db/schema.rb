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

ActiveRecord::Schema.define(version: 2021_09_17_055424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_addresses_on_therapist_id"
  end

  create_table "alliances", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.bigint "therapist_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_alliances_on_therapist_id"
    t.index ["user_id"], name: "index_alliances_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.boolean "seen_therapist"
    t.boolean "taking_meds"
    t.string "country"
    t.string "city"
    t.string "state"
    t.date "birth_date"
    t.integer "onboarding_step"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_contact_infos_on_therapist_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.string "major"
    t.string "level"
    t.string "type"
    t.string "location"
    t.boolean "display"
    t.integer "year_achieved"
    t.string "photo_url"
    t.boolean "verified"
    t.bigint "user_id", null: false
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_credentials_on_therapist_id"
    t.index ["user_id"], name: "index_credentials_on_user_id"
  end

  create_table "demographics", force: :cascade do |t|
    t.string "name"
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_demographics_on_therapist_id"
  end

  create_table "faiths", force: :cascade do |t|
    t.string "name"
    t.bigint "client_id", null: false
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_faiths_on_client_id"
    t.index ["therapist_id"], name: "index_faiths_on_therapist_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.bigint "client_id"
    t.bigint "therapist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_insurances_on_client_id"
    t.index ["therapist_id"], name: "index_insurances_on_therapist_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.bigint "client_id"
    t.bigint "therapist_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_languages_on_client_id"
    t.index ["therapist_id"], name: "index_languages_on_therapist_id"
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.string "photo_url"
    t.bigint "user_id", null: false
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_licenses_on_therapist_id"
    t.index ["user_id"], name: "index_licenses_on_user_id"
  end

  create_table "modalities", force: :cascade do |t|
    t.string "name"
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_modalities_on_therapist_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "payment_options_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_options_id"], name: "index_payment_methods_on_payment_options_id"
  end

  create_table "payment_options", force: :cascade do |t|
    t.integer "min_rate"
    t.integer "max_rate"
    t.string "category"
    t.boolean "sliding_scale"
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_payment_options_on_therapist_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "problems"
    t.string "expectations"
    t.string "further_info"
    t.string "setting_preference"
    t.integer "min_budget"
    t.integer "max_budget"
    t.boolean "is_insured"
    t.boolean "out_of_pocket_only"
    t.boolean "active"
    t.boolean "acquired_here"
    t.boolean "anonymize"
    t.date "anonymization_date"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_posts_on_client_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.text "message"
    t.string "status"
    t.bigint "post_id", null: false
    t.bigint "therapist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_proposals_on_post_id"
    t.index ["therapist_id"], name: "index_proposals_on_therapist_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "message"
    t.string "reporter_email"
    t.boolean "resolved"
    t.string "admin_comments"
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.bigint "therapist_id", null: false
    t.bigint "proposal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_reports_on_client_id"
    t.index ["proposal_id"], name: "index_reports_on_proposal_id"
    t.index ["therapist_id"], name: "index_reports_on_therapist_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "specialized_issues", force: :cascade do |t|
    t.string "name"
    t.bigint "therapist_id"
    t.bigint "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_specialized_issues_on_post_id"
    t.index ["therapist_id"], name: "index_specialized_issues_on_therapist_id"
  end

  create_table "therapists", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.text "description"
    t.string "profile_image_url"
    t.text "therapy_process"
    t.string "website_url"
    t.string "phone"
    t.string "country"
    t.string "birth_date"
    t.string "setting_preference"
    t.boolean "show_age"
    t.integer "onboarding_step"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_therapists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "role"
    t.boolean "verified"
    t.string "verification"
    t.boolean "anonymized"
    t.string "anonymousToken"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "therapists"
  add_foreign_key "alliances", "therapists"
  add_foreign_key "alliances", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "contact_infos", "therapists"
  add_foreign_key "credentials", "therapists"
  add_foreign_key "credentials", "users"
  add_foreign_key "demographics", "therapists"
  add_foreign_key "faiths", "clients"
  add_foreign_key "faiths", "therapists"
  add_foreign_key "insurances", "clients"
  add_foreign_key "insurances", "therapists"
  add_foreign_key "languages", "clients"
  add_foreign_key "languages", "therapists"
  add_foreign_key "languages", "users"
  add_foreign_key "licenses", "therapists"
  add_foreign_key "licenses", "users"
  add_foreign_key "modalities", "therapists"
  add_foreign_key "payment_options", "therapists"
  add_foreign_key "posts", "clients"
  add_foreign_key "proposals", "posts"
  add_foreign_key "proposals", "therapists"
  add_foreign_key "reports", "clients"
  add_foreign_key "reports", "proposals"
  add_foreign_key "reports", "therapists"
  add_foreign_key "reports", "users"
  add_foreign_key "specialized_issues", "posts"
  add_foreign_key "specialized_issues", "therapists"
  add_foreign_key "therapists", "users"
end
