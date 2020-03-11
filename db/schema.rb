# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_11_133025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_countries_on_code", unique: true
  end

  create_table "emissions", force: :cascade do |t|
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id", null: false
    t.bigint "sector_id", null: false
    t.index "((data -> 'year'::text))", name: "index_year_on_data_emissions"
    t.index ["country_id", "sector_id"], name: "index_emissions_on_country_id_and_sector_id", unique: true
    t.index ["country_id"], name: "index_emissions_on_country_id"
    t.index ["data"], name: "index_emissions_on_data", using: :gin
    t.index ["sector_id"], name: "index_emissions_on_sector_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_sector_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_sectors_on_name", unique: true
    t.index ["parent_sector_id"], name: "index_sectors_on_parent_sector_id"
  end

  add_foreign_key "emissions", "countries"
  add_foreign_key "emissions", "sectors"
end
