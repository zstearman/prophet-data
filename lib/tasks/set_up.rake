require 'nokogiri'
require 'open-uri'

namespace :set_up do
  desc "Import Current Teams from ESPN"
  task import_teams: :environment do
    doc = Nokogiri::HTML(open("http://www.espn.com/mens-college-basketball/teams"))
    conferences = doc.css("div.mod-teams-list-medium")
    
    # Cycle through conferences filling in the name of each team along with their homepage url
    x = 1
    conferences.each do |conference|
      conf = Conference.find_or_initialize_by(name: conference.css("div.mod-header h4").text)
      conf.id = x
      conf.save
      teams = conference.css("ul li")
      y = 0 
      teams.each do |row|
        team_link = row.css("a.bi")
        team_name = team_link.text
        team_url = team_link[0]['href']
        espn_id = team_url[/#{'/_/id/'}(.*?)#{'/'}/m, 1]
        team = Team.find_or_initialize_by(espn_id: espn_id)
        if team
          team.conference_id = x
          team.home_url = team_url
          team.save
        else
          print row
        end
      end
      x += 1
    end
    # Visit each team URL to get the rest of the team info and correct team name
    Team.all.each do |new_team|
      doc = Nokogiri::HTML(open(new_team.home_url))
      header = doc.css("div.global-nav-container ul.first-group")
      school = header.css("li.team-name span.link-text-short").text
      long_name = header.css("li.team-name span.link-text").text
      logo = header.css("span.brand-logo img").attr('src').to_s
      long_name.slice! school
      long_name.strip!
      logo.slice! "&h=150&w=150"
      new_team.school = school
      new_team.nickname = long_name
      new_team.logo_url = logo
      new_team.save
    end
  end

  desc "Import Players from ESPN Rosters"
  task import_players: :environment do
    Player.all.update_all(team_id: nil)
    Team.all.each do |team|
      loc = team.home_url.index('/_/')
      url = team.home_url.insert(loc, '/roster')
      doc = Nokogiri::HTML(open(url))
      players = doc.css('div.mod-content tr.oddrow, div.mod-content tr.evenrow')
      players.each do |player|
        player_url = player.css('td a').attr('href').to_s
        espn_id = player_url[player_url.index('/_/id/') + 6, 7]
        name = player.css('td')[1].text
        height = player.css('td')[3].text
        height_array = height.split('-')
        height = (height_array.first.to_i * 12 ) + height_array.last.to_i
        new_player = Player.find_or_initialize_by(espn_id: espn_id)
        new_player.team = team
        new_player.number = player.css('td')[0].text
        new_player.first_name = name.rpartition(' ').first
        new_player.last_name = name.rpartition(' ').last
        new_player.position = player.css('td')[2].text
        new_player.height = height
        new_player.weight = player.css('td')[4].text
        new_player.year = player.css('td')[5].text
        new_player.hometown = player.css('td')[6].text
        new_player.save
      end
    end
  end
  
  desc "Create TeamSeasons for current season"
  task create_team_seasons: :environment do
    season = Season.where(current: true).first
    Team.all.each do |team|
     team_season = TeamSeason.find_or_initialize_by(season_id: season.id, team_id: team.id)
     team_season.save
    end
  end
  
  
  desc "Get games from dates"
  task create_games_with_input: :environment do
    puts "Input start date in YYYYMMDD format"
    start_date = STDIN.gets.strip
    puts "Input end date in YYYYMMDD format"
    end_date = STDIN.gets.strip
    start_date = start_date.to_i
    end_date = end_date.to_i
    (start_date..end_date).each do |day|
      url = "http://www.espn.com/mens-college-basketball/schedule/_/date/" + day.to_s + "/group/50"
      doc = Nokogiri::HTML(open(url))
      games = doc.css('div#sched-container tr.odd, div.sched-container tr.even')
      x = 0
      games.each do |game|
        game_url = game.css('td')[2].css('a').attr('href').to_s
        espn_id = game_url[game_url.index('gameId=') + 7, 9]
        puts espn_id
        x += 1
      end
      puts x.to_s + " games on " + day.to_s
    end
  end
end
