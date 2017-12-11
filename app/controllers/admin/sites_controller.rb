class Admin::SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site, only: [:edit, :update]
  layout "admin"

  def index
    @sites = current_user.sites
    @sites = @sites.page params[:page]
  end

  def edit
    @navbar = @site.navbars.new
  end

  def update
    @navbars = @site.navbars
    @navbar = @site.navbars.create
    @site.update(site_params)
    redirect_to admin_sites_path
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:site_name, :site_url)
  end
end
