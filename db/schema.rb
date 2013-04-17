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

ActiveRecord::Schema.define(:version => 20130415110312) do

  create_table "bonus", :force => true do |t|
    t.string   "empid"
    t.decimal  "bonus"
    t.string   "period_id"
    t.string   "period_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "config_tables", :force => true do |t|
    t.decimal  "hra_percent"
    t.decimal  "basic_percent"
    t.decimal  "conveyance"
    t.decimal  "professional_tax"
    t.decimal  "edu_cess"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "emp_declarations", :force => true do |t|
    t.string   "emp_id"
    t.string   "hra_status"
    t.decimal  "total_hra"
    t.decimal  "medical_receipts"
    t.decimal  "insurance_80c"
    t.decimal  "ppf_80c"
    t.decimal  "mf_80c"
    t.decimal  "hloan_principal_80c"
    t.decimal  "nsc_80c"
    t.decimal  "children_fee_80c"
    t.decimal  "infrabonds_80c"
    t.decimal  "others_80c"
    t.decimal  "med_insurance_80d"
    t.decimal  "donations_80g"
    t.decimal  "interest_EduLoan_80e"
    t.string   "house_self_occupied"
    t.decimal  "house_rent"
    t.decimal  "home_loan_interest"
    t.string   "updated_by"
    t.string   "locked_for_employee"
    t.string   "locked_for_admin"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "emp_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email_id"
    t.text     "address"
    t.integer  "phone_number"
    t.integer  "pan_number"
    t.integer  "bank_acc_no"
    t.string   "designation"
    t.string   "grossCTC"
    t.date     "date_of_joining"
    t.date     "date_of_birth"
    t.date     "date_of_relieve"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pay_periods", :force => true do |t|
    t.string   "period_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "period_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "payment_histories", :force => true do |t|
    t.string   "emp_id"
    t.string   "period_id"
    t.string   "period_type"
    t.decimal  "gross_monthly"
    t.decimal  "basic"
    t.decimal  "hra"
    t.decimal  "conveyance"
    t.decimal  "medical_allowance"
    t.decimal  "professional_tax"
    t.decimal  "loss_of_hours"
    t.decimal  "tax_deducted"
    t.decimal  "net_monthly"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tax_slabs", :force => true do |t|
    t.decimal  "slab_from"
    t.decimal  "slab_to"
    t.decimal  "deduction_percent"
    t.decimal  "min_tax"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "user_logins", :force => true do |t|
    t.string   "emp_id"
    t.string   "user_name"
    t.string   "password"
    t.date     "last_logged_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "is_admin"
  end

end
