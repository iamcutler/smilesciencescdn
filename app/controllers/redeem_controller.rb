class RedeemController < ApplicationController
  def index
    @today = Time.now
    @todayPickerFormat = @today.strftime("%Y-%m-%d")
  end

  def export
  end
end
