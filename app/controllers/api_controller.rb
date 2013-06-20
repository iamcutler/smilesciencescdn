class ApiController < ApplicationController
  def redeem
  end

  def mailinglist
    require 'json'


    data = Rack::Utils.parse_nested_query(params[:query])
    if !find_mailing_list_by_email(data['email'])
      result = MailingList.new(:first_name => data['fname'], :last_name => data['lname'], :email_address => data['email'], :phone => data['phone'])
      result.save
    end
  end

  private

    def find_mailing_list_by_email(email)
      result = MailingList.find_by_email_address(email)
      result
    end
end