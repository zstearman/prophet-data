require 'nokogiri'
require 'open-uri'

class AdminController < ApplicationController
  
  def tasks
    
  end
  
  def import_teams
    redirect_to admin_path
  end
end
