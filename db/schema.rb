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

ActiveRecord::Schema.define(version: 20221027152548) do

  create_table "cuisines", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cuisines", ["name"], name: "unique_cuisine", unique: true

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",             null: false
    t.float    "calorie_per_gram"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "ingredients", ["name"], name: "unique_ingredient", unique: true

  create_table "recipe_ingredients", force: :cascade do |t|
    t.string   "unit"
    t.float    "amount",        default: 0.0
    t.string   "metric_unit"
    t.float    "metric_amount", default: 0.0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "steps",      null: false
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cuisine_id"
  end

  add_index "recipes", ["cuisine_id"], name: "index_recipes_on_cuisine_id"

end
