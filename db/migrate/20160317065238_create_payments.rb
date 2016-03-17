class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.references :loan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
