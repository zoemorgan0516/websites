class Admin::SitesController < ApplicationController
  #  before_action :authenticate_user!
  layout "admin"

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.save
      redirect_to edit_admin_site_path(@site)
    else
      render :new
    end
  end


  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to admin_sites_path
    else
      render :new
    end
  end

  private

  def site_params
    params.require(:site).permit(:site_name, :site_url)
  end
end
