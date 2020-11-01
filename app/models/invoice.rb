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

  private
  #validations for posting date i.e it should not be a future date
  def posting_date_should_be_in_past
    if posting_date > Date.today
      error.add(:posting_date, "must be in past")
    end
  end
  
end
