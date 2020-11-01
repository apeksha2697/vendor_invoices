require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "succesfully save" do
    invoice = build(:invoice)
    assert true, invoice.valid?
    assert true, invoice.save
  end

  test "invoice number should be unique" do
    invoice1 = create(:invoice)
    invoice2 = build(:invoice, invoice_number: invoice1.invoice_number)
    assert_not invoice2.valid?
  end
end
