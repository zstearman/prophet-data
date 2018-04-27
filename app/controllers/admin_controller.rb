require 'nokogiri'
require 'open-uri'

class AdminController < ApplicationController
  
  def tasks
    
  end
  
  def import_teams
    doc = Nokogiri::HTML(open("https://www.ncaa.com/standings/basketball-men/d1"))
    conferences = doc.css("div.ncaa-standings-conference")
    x = 1
    conferences.each do |conference|
      x += 1
      conf = Conference.find_or_initialize_by(name: conference.css("div.ncaa-standings-conference-name").text)
      conf.id = x
      conf.save
      teams = conference.css("table.ncaa-standing-conference-table tr")
      y = 0 
      teams.each do |team|
        if y > 1
          team_link = team.css("td.ncaa-standing-conference-team a")
          team_name = team_link.text
          team_url ='https://www.ncaa.com' + team_link[0]['href']
          puts team_name
          puts team_url
        end
        y += 1
      end
    end
    redirect_to admin_path
  end
end
