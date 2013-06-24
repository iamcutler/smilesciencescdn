# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130624193957) do

  create_table "mailing_lists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address", :null => false
    t.string   "phone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "voucher_redemptions", :force => true do |t|
    t.string   "first_name",                             :null => false
    t.string   "last_name",                              :null => false
    t.string   "email",                                  :null => false
    t.string   "phone"
    t.string   "site_purchased",                         :null => false
    t.string   "quantity",                               :null => false
    t.string   "voucher_number_1",                       :null => false
    t.string   "voucher_number_2"
    t.string   "voucher_number_3"
    t.string   "voucher_number_4"
    t.string   "voucher_number_5"
    t.string   "voucher_number_6"
    t.text     "products",         :limit => 2147483647, :null => false
    t.string   "address",                                :null => false
    t.string   "address2"
    t.string   "city",                                   :null => false
    t.string   "state",                                  :null => false
    t.string   "zip_code",                               :null => false
    t.string   "country",                                :null => false
    t.text     "comments",         :limit => 2147483647
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

end
