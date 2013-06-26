class RedeemController < ApplicationController
  def index
    @today = Time.now
    @todayPickerFormat = @today.strftime("%Y-%m-%d")
  end

  def export
    require 'rubygems'
    require 'google_drive'

    #fetch model data
    @result = VoucherRedemption.where("created_at <= #{params[:start]} AND created_at >= #{params[:end]}")
    #Spreadsheet key
    @key = "0AgUaj0k6ZzktdDNaOEJzV1JlZjFhWmVGMmJwVnJRZWc"

    # Logs in.
    # You can also use OAuth. See document of
    # GoogleDrive.login_with_oauth for details.
    session = GoogleDrive.login("vouchers@smilesciences.com", "Two11rocks")

    # First worksheet of
    ws = session.spreadsheet_by_key(@key).worksheets[0]

    # Gets content of A2 cell.
    p ws[2, 1]  #==> "hoge"

    # Changes content of cells.
    # Changes are not sent to the server until you call ws.save().
    ws[2, 1] = "foo"
    ws[2, 2] = "bar"
    if ws.save()
      # Reloads the worksheet to get changes by other clients.
      ws.reload()
      #Redirect to redeem and show successfully notice
      redirect_to :redeem, :notice => 'The spreadsheet exported successfully. Please check your google drive.'
    else
      redirect_to :redeem, :notice => 'A error occurred. Please try again.'
    end

    # Dumps all cells.
    #for row in 1..ws.num_rows
      #for col in 1..ws.num_cols
        #p ws[row, col]
      #end
    #end

    # Yet another way to do so.
    #p ws.rows  #==> [["fuga", ""], ["foo", "bar]]
  end
end
