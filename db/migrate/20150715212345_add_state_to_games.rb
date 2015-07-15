class AddStateToGames < ActiveRecord::Migration
  def up
    add_column :games, :state_id, :integer
    change_column_null :games, :state_id, false
  end

  def down
    remove_column :games, :state_id, :integer
  end
end
