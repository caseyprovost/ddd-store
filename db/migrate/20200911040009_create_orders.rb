class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_in_cents, null: false
      t.integer :adjustment_total_in_cents, null: false
      t.integer :item_total_in_cents, null: false
      t.integer :tax_total_in_cents, null: false
      t.integer :shipment_total_in_cents, null: false
      t.references :user, null: true, foreign_key: true
      t.references :store, null: true, foreign_key: true

      t.timestamps
    end
  end
end
