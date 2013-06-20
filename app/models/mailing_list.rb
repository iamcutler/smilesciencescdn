class MailingList < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :phone

  validates :email_address, :presence => true
end
