class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order
      t.references :book
      t.integer :quantity
      t.integer :status
      t.date :date_end

      t.timestamps
    end
  end
end
