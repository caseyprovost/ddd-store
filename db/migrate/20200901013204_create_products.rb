class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :store, null: false, foreign_key: true
      t.string :name, null: false, index: { unique: true }, default: ""
      t.text :description
      t.string :featured_image
      t.string :slug, null: false, index: { unique: true }, default: ""
      t.bigint :price_in_cents, null: false, default: ""

      t.timestamps
    end
  end
end
