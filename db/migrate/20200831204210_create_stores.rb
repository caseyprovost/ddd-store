class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false, default: "", index: { unique: true }
      t.string :subdomain, null: false, default: "", index: { unique: true }
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
