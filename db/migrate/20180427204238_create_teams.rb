class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :school, index: true
      t.string :nickname
      t.string :abbreviation, index: true
      t.string :home_url
      t.string :arena
      t.string :logo_url
      t.references :conference, foreign_key: true

      t.timestamps
    end
  end
end
