class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number, null: false
      t.integer :document_number, null: false
      t.string :document_type, null: false
      t.date :due_date, null: false
      t.date :document_date, null: false
      t.date :posting_date, null: false
      t.float :amount, null: false
      t.references :vendor, null: false, foreign_key: true
      t.index :invoice_number, unique: true

      t.timestamps
    end
  end
end
