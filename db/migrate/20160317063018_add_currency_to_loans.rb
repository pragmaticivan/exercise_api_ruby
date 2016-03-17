class AddCurrencyToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :currency, :string
  end
end
