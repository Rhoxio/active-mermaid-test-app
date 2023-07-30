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

ActiveRecord::Schema[7.0].define(version: 2023_07_30_200722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clusters", force: :cascade do |t|
    t.integer "total_galaxies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galaxies", force: :cascade do |t|
    t.integer "diameter_in_light_years"
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_galaxies_on_cluster_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "planet_type"
    t.integer "population"
    t.bigint "system_id"
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_planets_on_cluster_id"
    t.index ["system_id"], name: "index_planets_on_system_id"
  end

  create_table "stars", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.text "description"
    t.bigint "galaxy_id"
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_stars_on_cluster_id"
    t.index ["galaxy_id"], name: "index_stars_on_galaxy_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.bigint "star_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["star_id"], name: "index_systems_on_star_id"
  end

end
