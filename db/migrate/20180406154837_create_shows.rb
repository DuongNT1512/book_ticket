class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.date :date, null: false
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.boolean :disabled, default: false
      t.belongs_to :movie, index: true
      t.belongs_to :screen, index: true

      t.timestamps
    end
  end
end
