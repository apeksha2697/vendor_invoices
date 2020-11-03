# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...I have used Rails6 , ruby version 2.5.3, postgres as a backend database. Clone the git repository and run “rails s” on the terminal to run server and then http://localhost:3000 on your browser to run locally. 

There are two models vendors and invoices
The Vendor model has 3 columns: name , code and vendor_type. Code for a vendor should be unique and vendor_type is general.

Invoices: its columns are  invoice_number, document_number, document_type,posting_date, due_date, document_date, amount. Invoice_number for every invoice should be unique, posting date cannot be a past date, amount can be negative(i have considered this case),document_types are RE RT KG KD ZA , any other document type will not be valid.

Associations
Vendors and invoices are associated with each other. Vendors can have many invoices and every invoice will be connected to one vendor. Vendor_id is the foreign key in invoices for creating associations.

Gems used
roo gem to upload and read files. Also I have handled different cases for different types of files like csv,xls,xlsx.
 roo-xls gem as  roo gem does not support xls file type.
Factory_bot gem and  faker gems for generating data for test cases, I have written some test cases for invoices and vendors models.

You can upload a file on the root page. When successfully uploaded you will be redirected to the summary page where a small summary of uploaded data is displayed.

