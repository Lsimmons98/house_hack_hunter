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

ActiveRecord::Schema[7.1].define(version: 2024_08_30_171803) do
  create_table "deals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "house_id"
    t.decimal "interest_rate", precision: 5, scale: 2
    t.decimal "down_payment_percentage", precision: 5, scale: 2
    t.decimal "purchase_price", precision: 12, scale: 2
    t.integer "loan_term_years"
    t.decimal "rehab_cost", precision: 12, scale: 2
    t.decimal "holding_cost", precision: 12, scale: 2
    t.decimal "utilities", precision: 12, scale: 2
    t.decimal "lawn_care", precision: 12, scale: 2
    t.decimal "insurance", precision: 12, scale: 2
    t.decimal "vacancy", precision: 5, scale: 2
    t.decimal "maintenance", precision: 5, scale: 2
    t.decimal "capital_expenditure", precision: 5, scale: 2
    t.decimal "property_management", precision: 5, scale: 2
    t.decimal "closing_costs", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_deals_on_house_id"
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.decimal "list_price", precision: 12, scale: 2
    t.decimal "annual_property_taxes", precision: 10, scale: 2
    t.integer "year_built"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer "house_id"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.decimal "monthly_rent", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_units_on_house_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deals", "houses"
  add_foreign_key "deals", "users"
  add_foreign_key "units", "houses"
end
