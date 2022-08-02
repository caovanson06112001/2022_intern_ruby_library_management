class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, index: true
      t.string :description
      t.date :dob

      t.timestamps
    end
  end
end
