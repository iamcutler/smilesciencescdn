class MailingList < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :phone

  validates :email_address, :presence => true
  validates_format_of :email_address, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
