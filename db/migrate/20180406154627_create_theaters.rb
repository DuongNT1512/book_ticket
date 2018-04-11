class CreateTheaters < ActiveRecord::Migration[5.1]
  def change
    create_table :theaters do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false
      t.boolean :disabled, default: false

      t.timestamps
    end
  end
end
