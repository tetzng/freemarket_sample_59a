class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :payment_card_no, :integer, null: false
    remove_column :users, :paymentmonth_id, :integer, null: false
    remove_column :users, :paymentyear_id, :integer, null: false
    remove_column :users, :payment_card_security_code, :integer, null: false
  end
end
