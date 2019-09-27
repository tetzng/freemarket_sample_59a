class RemovePhonenumFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_num, :string
  end
end
