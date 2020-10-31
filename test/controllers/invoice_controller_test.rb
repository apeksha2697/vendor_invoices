require 'test_helper'

class InvoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get invoice_new_url
    assert_response :success
  end

end
