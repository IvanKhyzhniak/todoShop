class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
