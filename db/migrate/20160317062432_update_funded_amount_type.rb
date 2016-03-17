class UpdateFundedAmountType < ActiveRecord::Migration
  def change
    change_table :loans do |t|
      t.change :funded_amount, :integer
    end
  end
end
