class AddDefaultToProducts < ActiveRecord::Migration[5.2]
  def change
    #デフォルト値を追加
    change_column_default :products, :status_id, 1

    #null制約を追加
    change_column_null :products, :delivery_charge_id, true
    change_column_null :products, :delivery_way_id, true
    change_column_null :products, :prefecture_id, true
    change_column_null :products, :delivery_days_id, true

    #serer_idいらない？いるならcontrollerでseler_id: current_user.id
    remove_column :products, :saler_id, :integer, null: false

  end
end