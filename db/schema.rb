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

ActiveRecord::Schema.define(version: 2019_09_24_140511) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "prefecture_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birth_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "birth_dd_id"
    t.string "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birth_months", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "birth_mm_id"
    t.string "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birth_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "birth_yyyy_id"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "paymentmonth_id"
    t.string "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "paymentyear_id"
    t.string "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
ActiveRecord::Schema.define(version: 2019_09_24_081726) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
<<<<<<< HEAD
    t.string "phone_num", null: false
    t.integer "authentication_num", null: false
    t.text "content"
    t.string "nickname", null: false
    t.integer "birth_yyyy_id", null: false
    t.integer "birth_mm_id", null: false
    t.integer "birth_dd_id", null: false
    t.string "zip_code1", null: false
    t.string "prefecture_id", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "telephone", default: "", null: false
    t.integer "payment_card_no", null: false
    t.integer "paymentmonth_id", null: false
    t.integer "paymentyear_id", null: false
    t.integer "payment_card_security_code", null: false
=======
    t.integer "birthday_year", null: false
    t.integer "birthday_month", null: false
    t.integer "birthday_day", null: false
    t.integer "phone_num", null: false
    t.integer "authentication_num", null: false
    t.text "content"
<<<<<<< HEAD
    t.string "provider"
    t.string "uid"
    t.string "token"
>>>>>>> omniauth
=======
>>>>>>> conflict
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
