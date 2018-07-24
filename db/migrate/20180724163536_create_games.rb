class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|

      t.timestamps
      t.references :season, foreign_key: true
      t.integer :season_type
      t.string :status
      t.string :away_team
      t.string :home_team
      t.integer :away_score
      t.integer :home_score
      t.datetime :updated
      t.string :period
      t.decimal :point_spread
      t.decimal :over_under
      t.integer :home_money_line
      t.integer :away_money_line
      t.integer :tournament_id
      t.string :bracket
      t.integer :round
      t.integer :away_seed
      t.integer :home_seed
      t.integer :espn_id
      t.integer :away_previous_espn_id
      t.integer :home_previous_espn_id
      t.integer :tournament_display_order
    end
  end
end
