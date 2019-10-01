class RenameTitreColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :delivery_charge, :delivery_charge_id
    rename_column :products, :delivery_way, :delivery_way_id
    rename_column :products, :delivery_area, :ddelivery_area_id
    rename_column :products, :delivery_days, :delivery_days_id
  end
end
