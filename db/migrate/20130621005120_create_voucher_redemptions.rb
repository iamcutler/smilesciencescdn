class CreateVoucherRedemptions < ActiveRecord::Migration
  def change
    create_table :voucher_redemptions do |t|
      t.string :first_name,         :null => false
      t.string :last_name,          :null => false
      t.string :email,              :null => false
      t.string :phone
      t.string :site_purchased,     :null => false
      t.string :quantity,           :null => false
      t.string :voucher_number_1,   :null => false
      t.string :voucher_number_2
      t.string :voucher_number_3
      t.string :voucher_number_4
      t.string :voucher_number_5
      t.string :voucher_number_6
      t.text :products,             :null => false, :limit => 4294967295
      t.string :address,            :null => false
      t.string :city,               :null => false
      t.string :state,              :null => false
      t.string :zip_code,           :null => false
      t.string :country,            :null => false
      t.text :comments,             :limit => 4294967295

      t.timestamps
    end
  end
end
