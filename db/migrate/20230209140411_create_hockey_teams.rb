class CreateHockeyTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :hockey_teams do |t|
      t.text :name
      t.integer :wins

      t.timestamps
    end
  end
end
