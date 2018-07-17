class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :start_year, index: true
      t.integer :end_year, index: true
      t.string :description
      t.date :start_date
      t.date :regular_season_end_date
      t.date :championship_date
      t.timestamps
    end
  end
end
