class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string   :group_name, null: false, default: ""
      t.timestamps
    end
  end
end
