class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name, null: false, unique: true
    end
  end
end
