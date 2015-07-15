class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abbr, null: false, unique: true
      t.string :name, null: false, unique: true
    end
  end
end
