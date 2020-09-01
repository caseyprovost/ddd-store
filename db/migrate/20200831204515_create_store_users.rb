class CreateStoreUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :store_users do |t|
      t.references :store, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end

    add_index :store_users, [:user_id, :store_id], unique: true
  end
end
