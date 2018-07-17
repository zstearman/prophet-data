class AddEspnIdToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :espn_id, :integer, uniqueness: true, index: true
  end
end
