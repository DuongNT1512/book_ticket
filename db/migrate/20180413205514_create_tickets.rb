class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :seat_code, null: false
      t.float :price, null: false
      t.boolean :disabled, default: false
      t.belongs_to :show, index: true
      t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
