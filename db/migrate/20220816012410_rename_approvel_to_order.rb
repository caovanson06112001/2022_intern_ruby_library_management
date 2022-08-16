class RenameApprovelToOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :approved, :status
  end
end
