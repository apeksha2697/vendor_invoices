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

ActiveRecord::Schema.define(version: 2020_10_31_072411) do

  create_table "invoices", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "document_number", null: false
    t.string "document_type", null: false
    t.date "due_date", null: false
    t.date "document_date", null: false
    t.date "posting_date", null: false
    t.integer "amount", null: false
    t.integer "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_number"], name: "index_invoices_on_document_number", unique: true
    t.index ["vendor_id"], name: "index_invoices_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "category", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_vendors_on_code", unique: true
  end

  add_foreign_key "invoices", "vendors"
end
