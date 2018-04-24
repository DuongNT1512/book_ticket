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

ActiveRecord::Schema.define(version: 20180413205514) do

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name", null: false
    t.string "vietnamese"
    t.date "release_date"
    t.integer "length", null: false
    t.integer "language", null: false
    t.string "actors"
    t.string "directors"
    t.text "description"
    t.integer "status", null: false
    t.integer "rate", null: false
    t.boolean "disabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_movies_on_name"
  end

  create_table "orders", force: :cascade do |t|
    t.float "amount", null: false
    t.integer "status", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "screens", force: :cascade do |t|
    t.string "name", null: false
    t.integer "seat_rows", null: false
    t.integer "seat_columns", null: false
    t.string "layout", null: false
    t.text "description"
    t.boolean "disabled", default: false
    t.integer "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_screens_on_name"
    t.index ["theater_id"], name: "index_screens_on_theater_id"
  end

  create_table "shows", force: :cascade do |t|
    t.float "ticket_price", null: false
    t.date "date", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.boolean "disabled", default: false
    t.integer "movie_id"
    t.integer "screen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_shows_on_movie_id"
    t.index ["screen_id"], name: "index_shows_on_screen_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "address", null: false
    t.boolean "disabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "seat_code", null: false
    t.boolean "disabled", default: false
    t.integer "show_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_tickets_on_order_id"
    t.index ["show_id"], name: "index_tickets_on_show_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "gender", null: false
    t.date "birthday"
    t.string "address"
    t.string "avatar", default: ""
    t.integer "role", default: 0
    t.boolean "disabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
