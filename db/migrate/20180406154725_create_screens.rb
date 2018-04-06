class CreateScreens < ActiveRecord::Migration[5.1]
  def change
    create_table :screens do |t|
      t.string :name, null: false, index: true
      t.text :description
      t.integer :seat, null: false
      t.boolean :disabled, default: false
      t.belongs_to :theater, index: true

      t.timestamps
    end
  end
end
