class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address, :null => false
      t.string :phone

      t.timestamps
    end
  end
end
