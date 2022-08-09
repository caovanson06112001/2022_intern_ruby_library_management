class CreateCategoriesBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :category_books do |t|
      t.references :book
      t.references :category
    end
  end
end
