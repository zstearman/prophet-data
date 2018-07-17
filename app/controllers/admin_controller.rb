require 'nokogiri'
require 'open-uri'

class AdminController < ApplicationController
  
  def tasks
    
  end
  
  
  # Seeds the database with all teams and conferences. Your conferences should first be loaded using db:seed
  
  def get_teams
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
        team = Team.find_or_initialize_by(school: team_name)
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
    redirect_to teams_path
  end
  
  # Seed database with the roster for each team.
  def get_players
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
    redirect_to teams_path  
  end
  
  def get_games
    url_root = "https://www.ncaa.com/scoreboard/basketball-men/d1/"
    start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    start_url = url_root + start_date.strftime('%Y/%m/%d')
    if end_date >= start_date 
      (start_date..end_date).each do |date|
        begin
          date_url = url_root + date.strftime('%Y/%m/%d')
          doc = Nokogiri::HTML(open(date_url))
        rescue OpenURI::HTTPError => e
          if e.message == '404 Not Found'
            # handle 404 error
          else
            # handle other errors
          end
        end
      end
    else
      redirect_to admin_path
    end
    redirect_to teams_path
  end
end
