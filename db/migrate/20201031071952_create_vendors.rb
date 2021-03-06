class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :vendor_type, null: false
      t.index :code, unique: true

      t.timestamps
    end
  end
end
