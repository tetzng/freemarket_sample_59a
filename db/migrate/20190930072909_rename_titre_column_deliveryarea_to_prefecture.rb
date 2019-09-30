class RenameTitreColumnDeliveryareaToPrefecture < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :ddelivery_area_id, :prefecture_id
  end
end