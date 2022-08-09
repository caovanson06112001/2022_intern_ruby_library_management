class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name, index: true, null: false
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
