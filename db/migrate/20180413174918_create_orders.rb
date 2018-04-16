class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :amount, null: false
      t.integer :status, null: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
