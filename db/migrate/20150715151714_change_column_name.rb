class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :games, :name, :description
  end
end
