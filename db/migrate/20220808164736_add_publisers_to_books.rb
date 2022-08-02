class AddPublisersToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :publisher_id, :integer
  end
end
