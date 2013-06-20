class ApiController < ApplicationController
  def redeem
  end

  def mailinglist
    require 'json'

    json = JSON.parse(params[:data])
    if !find_mailing_list_by_email(json['contact']['email'])
      result = MailingList.new(:first_name => json['contact']['first_name'], :last_name => json['contact']['last_name'], :email_address => json['contact']['email'], :phone => json['contact']['phone'])
      result.save
    end
  end

  private

    def find_mailing_list_by_email(email)
      result = MailingList.find_by_email_address(email)
      result
    end
end