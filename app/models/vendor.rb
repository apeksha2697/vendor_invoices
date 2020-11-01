class Vendor < ApplicationRecord
  #associations
  has_many :invoices

  #validations
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :vendor_type, presence: true
end
