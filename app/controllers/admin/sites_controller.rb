class Admin::SitesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_site, only: [:edit, :update]
  layout "admin"

  def index
    @site = current_user.site
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to admin_sites_path
    else
      render :edit
    end
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:site_name, :site_url)
  end
end
