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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110522131256) do

  create_table "competences", :force => true do |t|
    t.integer  "service_id"
    t.string   "competenceType"
    t.string   "competenceUrl"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inf_entities", :force => true do |t|
    t.integer  "service_id"
    t.string   "entity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_entities", :force => true do |t|
    t.integer  "service_id"
    t.string   "entity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "serviceName"
    t.string   "provider"
    t.string   "servicetype"
    t.integer  "ranking"
    t.string   "url"
    t.string   "imgPath"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.integer  "service_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "userName"
    t.string   "email"
    t.string   "passwordHash"
    t.string   "passwordSalt"
    t.integer  "activateCode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
