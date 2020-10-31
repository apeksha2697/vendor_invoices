class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :number, null: false
      t.integer :document_number, null: false
      t.string :document_type, null: false
      t.date :due_date, null: false
      t.date :document_date, null: false
      t.date :posting_date, null: false
      t.integer :amount, null: false
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
