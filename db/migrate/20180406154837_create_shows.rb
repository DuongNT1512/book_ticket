class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.float :ticket_price, null: false;
      t.date :date, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.boolean :disabled, default: false
      t.belongs_to :movie, index: true
      t.belongs_to :screen, index: true

      t.timestamps
    end
  end
end
