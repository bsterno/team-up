class RemoveCityAndStateIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :city, :string
    remove_column :games, :state_id, :string
  end
end
