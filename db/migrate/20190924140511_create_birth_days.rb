class CreateBirthDays < ActiveRecord::Migration[5.2]
  def change
    create_table :birth_days do |t|
      t.integer :birth_dd_id
      t.string :day

      t.timestamps
    end
  end
end
