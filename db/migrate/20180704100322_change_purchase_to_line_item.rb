class ChangePurchaseToLineItem < ActiveRecord::Migration[5.2]
  def change
    rename_table :purchases, :line_items
  end
end
