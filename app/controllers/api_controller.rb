class ApiController < ApplicationController
  helper_method :check_existing_voucher_numbers, :saveRedemption

  def redeem
    headers['Access-Control-Allow-Origin'] = "*"
    data = Rack::Utils.parse_nested_query(params[:query])
    products = data['product']
    response = '{ "response" : "An error has occurred. Please try again." }'

    #If any voucher number is already used
    if check_existing_voucher_numbers(data)
      response = '{ "response" : "One of the voucher numbers you entered has already been used. Please double check your vouchers before continuing."}'
    else
      if products
        #Save redemption after validation
        if saveRedemption(data)
          response = '{ "response" : "success" }'
        end
      else
        response = '{ "response" : "Please select at least one product purchased" }'
      end
    end

    render :json => response
  end

  def mailinglist
    data = Rack::Utils.parse_nested_query(params[:query])
    first_name = data['contact']['first_name']
    last_name = data['contact']['last_name']
    email = data['contact']['email']
    phone = data['contact']['phone']

    unless find_mailing_list_by_email(email)
      result = MailingList.new(:first_name => first_name, :last_name => last_name, :email_address => email, :phone => phone)
      result.save
    end
  end

  private

    def find_mailing_list_by_email(email)
      result = MailingList.find_by_email_address(email)
      result
    end

    def check_existing_voucher_numbers(redemption)
      status = false
      #Loop through and validate new voucher numbers
      redemption['voucher'].each do |num|
        number = num[1]
        unless number.blank?
          result = VoucherRedemption.where("voucher_number_1 = '#{number}' OR voucher_number_2 = '#{number}' OR voucher_number_3 = '#{number}' OR voucher_number_4 = '#{number}' OR voucher_number_5 = '#{number}' OR voucher_number_6 = '#{number}'")
          unless result.count == 0
            status = true
          end
        end
      end
      status
    end

    def saveRedemption(data)
      contact = data['contact']
      voucher = data['voucher']
      products = data['product']
      status = false

      result = VoucherRedemption.new do |u|
        u.first_name = contact['first_name']
        u.last_name = contact['last_name']
        u.email = contact['email']
        u.phone = contact['phone']
        u.site_purchased = contact['site_purchased']
        u.quantity = contact['quantity']
        u.voucher_number_1 = voucher['voucher_number_1']
        u.voucher_number_2 = voucher['voucher_number_2']
        u.voucher_number_3 = voucher['voucher_number_3']
        u.voucher_number_4 = voucher['voucher_number_4']
        u.voucher_number_5 = voucher['voucher_number_5']
        u.voucher_number_6 = voucher['voucher_number_6']
        u.products = products.to_s
        u.address = contact['address']
        u.city = contact['city']
        u.state = contact['state']
        u.zip_code = contact['zip_code']
        u.country = contact['country']
        u.comments = contact['comments']
      end
      if result.save
        status = true
      end
      status
    end
end