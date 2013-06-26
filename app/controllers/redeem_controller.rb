class RedeemController < ApplicationController
  def index
    @today = Time.now
    @todayPickerFormat = @today.strftime("%Y-%m-%d")
  end

  def export
    require 'rubygems'
    require 'google_drive'

    #fetch model data
    result = VoucherRedemption.all
    #Spreadsheet key
    key = "0AgUaj0k6ZzktdDNaOEJzV1JlZjFhWmVGMmJwVnJRZWc"

    # Logs in.
    # You can also use OAuth. See document of
    # GoogleDrive.login_with_oauth for details.
    session = GoogleDrive.login("vouchers@smilesciences.com", "Two11rocks")

    # First worksheet of
    ws = session.spreadsheet_by_key(key).worksheets[0]

    #Dumps all cells.
    for row in 1..ws.num_rows
      for col in 1..ws.num_cols
        p ws[row, col]
      end
    end

    # Gets content of A2 cell.
    #p ws[2, 1]  #==> "hoge"

    #Create header
    voucherColumns = VoucherRedemption.column_names
    (1..voucherColumns.length).each do |column|
      ws[1,column] = voucherColumns[column]
    end

    # Changes content of cells.
    count = 2
    result.each do |voucher|
      ws[count, 1] = voucher.first_name
      ws[count, 2] = voucher.last_name
      ws[count, 3] = voucher.email
      ws[count, 4] = voucher.phone
      ws[count, 5] = voucher.site_purchased
      ws[count, 6] = voucher.quantity
      ws[count, 7] = voucher.voucher_number_1
      ws[count, 8] = voucher.voucher_number_2
      ws[count, 9] = voucher.voucher_number_3
      ws[count, 10] = voucher.voucher_number_4
      ws[count, 11] = voucher.voucher_number_5
      ws[count, 12] = voucher.voucher_number_6
      ws[count, 13] = voucher.products
      ws[count, 14] = voucher.address
      ws[count, 15] = voucher.address2
      ws[count, 16] = voucher.city
      ws[count, 17] = voucher.state
      ws[count, 18] = voucher.zip_code
      ws[count, 19] = voucher.country
      ws[count, 20] = voucher.comments
      count += 1
    end

    # Changes are not sent to the server until you call ws.save().
    if ws.save()
      # Reloads the worksheet to get changes by other clients.
      ws.reload()
      #Redirect to redeem and show successfully notice
      redirect_to :redeem, :notice => 'The spreadsheet exported successfully. Please check your google drive.'
    else
      redirect_to :redeem, :notice => 'A error occurred. Please try again.'
    end

    # Yet another way to do so.
    #p ws.rows  #==> [["fuga", ""], ["foo", "bar]]
  end
end
