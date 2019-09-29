class AddColumnCity < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_yyyy_id, :integer, null: false
    add_column :users, :birth_mm_id, :integer, null: false
    add_column :users, :birth_dd_id, :integer, null: false
    add_column :users, :zip_code1, :string, null: false
    add_column :users, :prefecture_id, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address1, :string, null: false
    add_column :users, :address2, :string
    add_column :users, :telephone, :string
    add_column :users, :payment_card_no, :integer, null: false
    add_column :users, :paymentmonth_id, :integer, null: false
    add_column :users, :paymentyear_id, :integer, null: false
    add_column :users, :payment_card_security_code, :integer, null: false
  end
end