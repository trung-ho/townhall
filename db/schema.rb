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

ActiveRecord::Schema.define(version: 20150622081640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_followers", force: true do |t|
    t.integer "organization_id"
    t.integer "follower_id"
    t.boolean "receive_app_notifications"
    t.boolean "receive_email"
  end

  add_index "organization_followers", ["follower_id"], name: "index_organization_followers_on_follower_id", using: :btree
  add_index "organization_followers", ["organization_id"], name: "index_organization_followers_on_organization_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "status"
    t.boolean  "show_recommendations"
    t.boolean  "show_subscriptions"
    t.string   "subscription_label"
    t.string   "subscription_issue_label"
    t.integer  "report_number"
    t.string   "page_alias"
    t.string   "facebook_page_url"
    t.string   "facebook_page_id"
    t.string   "facebook_page_access_token"
    t.string   "user_id"
    t.text     "twitter_feed"
    t.string   "contact_email"
    t.string   "contact_website"
    t.string   "contact_telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "banner"
    t.string   "phone"
    t.string   "website"
    t.string   "string"
    t.string   "twitter"
    t.string   "facebook"
    t.text     "description"
  end

  add_index "organizations", ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "published"
    t.string   "type"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "properties"
    t.string   "cover_image"
    t.string   "question_image"
    t.integer  "unique_visitors", default: 0
    t.boolean  "draft"
  end

  create_table "rankable_items", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "ranking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",     default: 0
  end

  create_table "reasons", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "reason_type"
    t.integer  "voting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "user_contributed"
    t.integer  "votes"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "role"
    t.string   "birth_year"
    t.string   "industry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.string   "vote_type"
    t.string   "reason_ids"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
