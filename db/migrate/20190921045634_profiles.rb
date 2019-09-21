class Profiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :create_user_id, :null: false
      t.text    :content
    end
  end
end
