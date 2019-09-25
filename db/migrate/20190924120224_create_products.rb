class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :paymentyear_id
      t.string :num

      t.timestamps
    end
  end
end
