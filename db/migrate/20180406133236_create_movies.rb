class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false, index: true
      t.string :vietnamese
      t.date :release_date
      t.integer :length, null: false
      t.integer :language, null: false
      t.string :actors
      t.string :directors
      t.text :description
      t.integer :status, null: false
      t.integer :rate, null: false
      t.boolean :disabled, default: false
      t.string :thumbnail
      t.string :carousel

      t.timestamps
    end
  end
end
