class SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    @navbar = @site.navbar(params[:navbar_id])
    puts "+"*30
    puts @navbar
  end

end
