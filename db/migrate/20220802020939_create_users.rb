class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, default: false
      t.string :phone_number

      t.timestamps
    end
  end
end
