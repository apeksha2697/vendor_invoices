class InvoicesController < ApplicationController
  
  def index
    @invoices = Invoice.all
  end

  def create
    summary_data = Invoice.import(params["/invoices/import"]['file'])
    redirect_to invoices_summary_path(summary_data)
  end
 
  def summary
    @summary_data = params.permit(:amount, :invalid_invoices, :invoice_uploaded, :vendor_uploaded)
  end
 
  private

    def invoice_params
      params.require(:invoice).permit(:id, :invoice_number, :document_number, :document_type, :due_date, :document_date, :posting_date, :amount)
    end
end
