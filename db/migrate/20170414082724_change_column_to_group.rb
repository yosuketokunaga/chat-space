class ChangeColumnToGroup < ActiveRecord::Migration[5.0]

  def up
    change_column :groups, :name, :string, null: false, default: ""
  end

  def down
    change_column :groups, :name, :string, null: true, default: ""
  end

end
