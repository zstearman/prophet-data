class AddIndexToEspnIdForPlayers < ActiveRecord::Migration[5.2]
  def change
    add_index :players, :espn_id, unique: true
  end
end
