class CreateMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.integer :paymentmonth_id
      t.string :num

      t.timestamps
    end
  end
end
