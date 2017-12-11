class NavbarController < ApplicationController
  def show
    @site = Site.find(params[:site_id])
    @navbar = @site.navbar(params[:id])
  end

end
