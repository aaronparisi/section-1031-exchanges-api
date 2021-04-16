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

ActiveRecord::Schema.define(version: 2021_04_16_013554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line1"
    t.string "line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "account_number"
    t.bigint "bank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_id"], name: "index_bank_accounts_on_bank_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "ein"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_id"], name: "index_documents_on_transaction_id"
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string "email"
    t.string "emailable_type", null: false
    t.bigint "emailable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emailable_type", "emailable_id"], name: "index_email_addresses_on_emailable"
  end

  create_table "employments", force: :cascade do |t|
    t.string "employerable_type", null: false
    t.bigint "employerable_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employments_on_employee_id"
    t.index ["employerable_type", "employerable_id"], name: "index_employments_on_employerable"
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "coordinator_id", null: false
    t.string "exchangorable_type", null: false
    t.bigint "exchangorable_id", null: false
    t.date "deadline_45"
    t.date "deadline_180"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coordinator_id"], name: "index_exchanges_on_coordinator_id"
    t.index ["exchangorable_type", "exchangorable_id"], name: "index_exchanges_on_exchangorable"
  end

  create_table "faxes", force: :cascade do |t|
    t.string "number"
    t.string "faxable_type", null: false
    t.bigint "faxable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faxable_type", "faxable_id"], name: "index_faxes_on_faxable"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number"
    t.string "callable_type", null: false
    t.bigint "callable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.index ["callable_type", "callable_id"], name: "index_phone_numbers_on_callable"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.string "ownerable_type", null: false
    t.bigint "ownerable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ownerable_type", "ownerable_id"], name: "index_properties_on_ownerable"
    t.index ["transaction_id"], name: "index_properties_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exchange_id"], name: "index_transactions_on_exchange_id"
  end

  add_foreign_key "bank_accounts", "companies", column: "bank_id"
  add_foreign_key "documents", "transactions"
  add_foreign_key "employments", "people", column: "employee_id"
  add_foreign_key "exchanges", "people", column: "coordinator_id"
  add_foreign_key "properties", "transactions"
  add_foreign_key "transactions", "exchanges"
end
