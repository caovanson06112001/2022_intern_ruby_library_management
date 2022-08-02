class CreateJoinTableCategoriesBooks < ActiveRecord::Migration[6.1]
  def change
    create_join_table :category_books, :books do |t|
    end
  end
end
