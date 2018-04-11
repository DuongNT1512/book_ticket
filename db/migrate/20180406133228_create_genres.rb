class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false, index: true
      t.text :description

      t.timestamps
    end
  end
end
