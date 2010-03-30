# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100330105956) do

  create_table "comments", :force => true do |t|
    t.text     "opinion"
    t.integer  "story_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rssfeeds", :force => true do |t|
    t.string   "url"
    t.datetime "last_fetched"
    t.string   "frequnecy"
    t.string   "name"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  create_table "social_tags", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id"
    t.text     "name"
    t.integer  "total_votes"
    t.integer  "score"
    t.integer  "total_cheers"
    t.integer  "total_jeers"
    t.integer  "total_activity"
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id"
    t.boolean  "accepted"
    t.boolean  "published"
    t.integer  "source"
    t.string   "source_type"
    t.datetime "published_at"
    t.datetime "accepted_at"
    t.datetime "original_publish_at"
    t.integer  "total_votes"
    t.integer  "score"
    t.integer  "total_cheers"
    t.integer  "total_jeers"
    t.integer  "total_activity"
  end

  create_table "story_tags", :force => true do |t|
    t.integer  "story_id"
    t.integer  "social_tag_id"
    t.integer  "total_votes"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id"
    t.integer  "total_cheers"
    t.integer  "total_jeers"
    t.integer  "total_activity"
  end

  create_table "votes", :force => true do |t|
    t.integer  "story_id"
    t.integer  "social_tag_id"
    t.integer  "sport_id"
    t.integer  "sentiment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "story_tag_id"
    t.integer  "total_cheers"
    t.integer  "total_jeers"
    t.integer  "total_activity"
  end

end
