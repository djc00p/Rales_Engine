class Changedefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:invoices, :status, nil)
  end
end
