class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :user_id,         :references, null: false
    add_column :products, :name,            :string,     null: false
    add_column :products, :description,     :text
    add_column :products, :delivery_charge, :string,     null: false
    add_column :products, :delivery_area,   :string,     null: false
    add_column :products, :delivery_days,   :string,     null: false
    add_column :products, :price,           :integer,    null: false
    add_column :products, :seler_id,        :integer,    null: false
    add_column :products, :status,          :string,     null: false
  end
end
