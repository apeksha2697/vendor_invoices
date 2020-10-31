class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
