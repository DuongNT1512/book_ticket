class CreateScreens < ActiveRecord::Migration[5.1]
  def change
    create_table :screens do |t|
      t.string :name, null: false, index: true
      t.integer :seat_rows, null: false
      t.integer :seat_columns, null: false
      t.string :layout, null: false
      t.text :description
      t.boolean :disabled, default: false
      t.belongs_to :theater, index: true

      t.timestamps
    end
  end
end
