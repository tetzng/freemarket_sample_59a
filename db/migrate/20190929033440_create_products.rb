class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user,         null: false
      t.string     :name,            null: false
      t.text       :description
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false
      t.integer    :size_id,         null: false
      t.string     :brand  
      t.string     :delivery_charge, null: false
      t.string     :delivery_way,    null: false
      t.string     :delivery_area,   null: false
      t.string     :delivery_days,   null: false
      t.integer    :price,           null: false
      t.integer    :saler_id,        null: false
      t.integer    :status_id,       null: false

      t.timestamps
    end
    add_index :products, :name
  end
end
