require 'test_helper'

class MailingListTest < ActiveSupport::TestCase
  test "should_not_save_without_an_email_address" do
    email = MailingList.new
    assert !email.save, "Saved without a provided email address"
  end
end
