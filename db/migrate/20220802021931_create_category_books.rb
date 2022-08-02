class CreateCategoryBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :category_books do |t|
      t.string :name, null:false, index: true

      t.timestamps
    end
  end
end
