class AddPublisersToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :publiser_id, :integer
  end
end
