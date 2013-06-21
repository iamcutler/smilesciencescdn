class VoucherRedemption < ActiveRecord::Base
  attr_accessible :address, :city, :comments, :country, :email, :first_name, :last_name, :phone, :quantity, :site_purchased, :state, :voucher_number_1, :voucher_number_2, :voucher_number_3, :voucher_number_4, :voucher_number_5, :voucher_number_6, :products, :zip_code

  validates :first_name, :last_name, :email, :site_purchased, :quantity, :voucher_number_1, :products, :address, :city, :state, :zip_code, :country, :presence => true
end
