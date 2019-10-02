class ChangePaymentCardNoOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :payment_card_no, :string
  end
end
