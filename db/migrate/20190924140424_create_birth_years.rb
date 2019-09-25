class CreateBirthYears < ActiveRecord::Migration[5.2]
  def change
    create_table :birth_years do |t|
      t.integer :birth_yyyy_id
      t.string :year

      t.timestamps
    end
  end
end
