class Invoice < ApplicationRecord
  #associations
  belongs_to :vendor

  before_save :posting_date_should_be_in_past 

  #validations
  validates :invoice_number, presence: true, uniqueness: true
  validates :document_number, presence: true
  validates :document_type, inclusion: { in: %w(RE RT KG KD ZA), message: " not a included in list" }, presence: true
  validates :due_date, presence: true
  validates :document_date, presence: true
  validates :posting_date, presence: true
  validates :amount, presence: true

  #import file
  def self.import(file)
    new_invoices = []
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    invoice_counter = Invoice.count
    vendor_counter = Vendor.count
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if vendor = Vendor.find_by(code: row["Vendor Code"])
        invoice = Invoice.new( invoice_number: row["Invoice Numbers"], document_number: row["Document Number"] , document_type:row["Type"], due_date:row["Net due dt"], document_date: row["Doc. Date"], posting_date:row["Pstng Date"], amount: row["Amt in loc.cur."], vendor_id: vendor.id)
        if invoice.valid?
          invoice.save
          new_invoices << invoice.id
        end
      else 
        vendor = Vendor.new(code: row["Vendor Code"], name: row["Vendor name"], vendor_type: row["Vendor type"])
        vendor.save
        invoice = Invoice.new( invoice_number: row["Invoice Numbers"], document_number: row["Document Number"] , document_type:row["Type"], due_date:row["Net due dt"], document_date: row["Doc. Date"], posting_date:row["Pstng Date"], amount: row["Amt in loc.cur."], vendor_id: vendor.id)
        if invoice.valid?
          invoice.save
          new_invoices << invoice.id
        end
      end
    end
    invoice_uploaded = Invoice.count - invoice_counter
    {
      invoice_uploaded: invoice_uploaded, 
      invalid_invoices: (2..spreadsheet.last_row).count - invoice_uploaded , 
      vendor_uploaded: Vendor.count - vendor_counter, 
      amount:  Invoice.where(id: new_invoices).sum("amount")
    }
  end
  
  #extention of file
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Spreadsheet.open(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private
  #validations for posting date i.e it should not be a future date
  def posting_date_should_be_in_past
    if posting_date > Date.today
      error.add(:posting_date, "must be in past")
    end
  end
  
end
