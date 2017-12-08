class Admin::NavbarController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def new
    @site = Site.find(params[:site_id])
    @navbar = @site.navbar.new
  end


  private

  def navbar_set
    @site = Site.find(params[:site_id])
    @navbar = @site.navbar.find(params[:id])
  end

  def navbar_params
    params.require(:navbar).permit(:avatar, :site_menu1, :site_menu2, :site_menu3, :site_menu4)
  end

end
