require 'test_helper'

class VoucherRedemptionTest < ActiveSupport::TestCase
  test "should not save without redemption information" do
    redeem = VoucherRedemption.new
    assert !redeem.save, "Should not save without contact information, products, and voucher numbers"
  end
end
