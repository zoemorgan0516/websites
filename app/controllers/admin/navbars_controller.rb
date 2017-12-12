class Admin::NavbarsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def create
    @site = Site.find(params[:site_id])
    @navbar = @site.navbars.new(navbar_params)
    @navbar.save
    redirect_to edit_admin_site_path(@site)
  end

  def update
    @site = Site.find(params[:site_id])
    @navbar = @site.navbars.update(navbar_params)
    redirect_to edit_admin_site_path(@site)
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
