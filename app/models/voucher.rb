class Voucher < ActiveRecord::Base
  attr_accessible :voucher_number, :site_source, :redeemed
end
