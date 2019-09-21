class Points < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer  :create_user_id, :null false
      t.integer  :get_point,      :null false
      t.string   :point_limit,    :null false
      t.integer  :saler_id,       :null false
      t.integer  :buyer_id,       :null false
    end
  end
end
