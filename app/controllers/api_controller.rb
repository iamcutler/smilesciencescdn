class ApiController < ApplicationController
  def redeem
  end

  def mailinglist
    data = Rack::Utils.parse_nested_query(params[:query])
    first_name = data['contact']['first_name']
    last_name = data['contact']['last_name']
    email = data['contact']['email']
    phone = data['contact']['phone']

    if !find_mailing_list_by_email(email)
      result = MailingList.new(:first_name => first_name, :last_name => last_name, :email_address => email, :phone => phone)
      result.save
    end
  end

  private

    def find_mailing_list_by_email(email)
      result = MailingList.find_by_email_address(email)
      result
    end
end