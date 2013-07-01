class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string    :voucher_number,  :null => false
      t.string    :site_source
      t.integer   :redeemed,        :null => false, :default => 0

      t.timestamps
    end
  end
end
