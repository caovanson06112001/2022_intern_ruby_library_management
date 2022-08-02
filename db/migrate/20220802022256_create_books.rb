class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name, index: true, null: false
      t.string :description
      t.string :publiser
      t.integer :quantity
      t.references :category_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
