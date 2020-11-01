require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test "code must be present" do
    vendor = build(:vendor, code: nil)
    assert_not vendor.valid?
    assert_not vendor.save
  end

  test "name must be present" do
    vendor = build(:vendor, name: nil)
    assert_not vendor.valid?
    assert_not vendor.save
  end

  test "vendor_type must be present" do
    vendor = build(:vendor, vendor_type: nil)
    assert_not vendor.valid?
    assert_not vendor.save
  end

  test "code must be unique" do
    vendor1 = create(:vendor)
    vendor2= build(:vendor, code: vendor1.code)
    assert_not vendor2.valid?
    assert_equal(["has already been taken"], vendor2.errors.messages[:code])
  end

end
