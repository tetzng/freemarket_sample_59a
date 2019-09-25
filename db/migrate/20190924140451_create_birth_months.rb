class CreateBirthMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :birth_months do |t|
      t.integer :birth_mm_id
      t.string :month

      t.timestamps
    end
  end
end
