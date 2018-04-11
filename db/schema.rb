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

ActiveRecord::Schema.define(version: 20180406154837) do

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

  create_table "screens", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "seat", null: false
    t.boolean "disabled", default: false
    t.integer "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_screens_on_name"
    t.index ["theater_id"], name: "index_screens_on_theater_id"
  end

  create_table "shows", force: :cascade do |t|
    t.date "date", null: false
    t.datetime "start", null: false
    t.datetime "end", null: false
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

end
