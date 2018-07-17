require 'csv'

# User.create!(first_name:  "Zach",
#             last_name: "Stearman",
#             email: "zstearman@prophetratings.com",
#             password:              "foobar",
#             password_confirmation: "foobar",
#             admin: true)
 
 
# Seeds from CSV Files 
            
conferences_csv = File.read(Rails.root.join('lib', 'seeds', 'conference_seed.csv'))
conferences = CSV.parse(conferences_csv, :headers => true)
conferences.each do |conference|
  conf = Conference.find_or_initialize_by(id: conference['id'])
  conf.name = conference['name']
  conf.key = conference['key']
  conf.save
end
  
# teams_csv = File.read(Rails.root.join('lib', 'seeds', 'team_seed.csv'))
# teams = CSV.parse(teams_csv, :headers => true)
# teams.each do |row|
#   team = Team.find_or_initialize_by(id: row['id'])
#   team.school = row ['school']
#   team.nickname = row['nickname']
#   team.abbreviation = row['abbreviation']
#   team.home_url = row['home_url']
#   team.arena = row['arena']
#   team.logo_url = row['logo_url']
#   team.conference_id = row['conference_id']
#   team.save
# end