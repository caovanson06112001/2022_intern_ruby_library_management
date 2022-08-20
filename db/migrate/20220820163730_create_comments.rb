class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.longtext :content
      t.references :user, index:true, null: false, foreign_key: true
      t.references :book, index:true, null: false, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
