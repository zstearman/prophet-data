class AddIndexToEspnIdOnTeams < ActiveRecord::Migration[5.2]
  def change
    add_index :teams, :espn_id
    add_column :games, :neutral, :boolean
  end
end
