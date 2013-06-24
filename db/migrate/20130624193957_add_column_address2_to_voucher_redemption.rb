class AddColumnAddress2ToVoucherRedemption < ActiveRecord::Migration
  def change
    add_column :voucher_redemptions, :address2, :string, :after => :address
  end
end
