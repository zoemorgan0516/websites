class Admin::SitesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_site, only: [:edit, :update]
  layout "admin"

  def index
    @site = current_user.site
  end

  def show
    @site = Site.find(params[:id])
    @footer = @site.footer
  end

  def new
    @site = Site.new
    @site.build_footer
  end

  def edit
  end

  def create
    @site = Site.new(site_params)
    @site.save
    redirect_to admin_sites_path
  end

  def update
    @site.update(site_params)
    @site.footer.update
    redirect_to edit_admin_site_path(@site)
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:avatar, :site_name, :site_url, footer_attributes: [ :avatar, :company_number, :company_address ])
  end
end
