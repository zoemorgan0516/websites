class Admin::SitesController < BaseController
  before_action :set_site, only: [:edit, :update]
  def index
    if can? :manage, Site
      @sites = Site.all.page params[:page]
    elsif can? :update, Site
      @sites = Site.where(id: current_user.site_id).page params[:page]
    elsif can? :read, Site
      render :show
    end
  end

  def show
    @site = current_user.site
    @categories = @site.categories
    @footer = @site.footer
  end

  def new
    if can? :manage, Site
      @site = Site.new
    end
    @site.build_footer
  end

  def edit
  end

  def create
    if can? :manage, Site
        @site = Site.new(site_params)
    end
    @site.save
    redirect_to admin_sites_path
  end

  def update
    @site.update(site_params)
    @site.footer.update
    redirect_to admin_sites_path
  end

  def destroy
    @site.destroy
    redirect_to admin_sites_path
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:avatar, :name, :domain, footer_attributes: [ :avatar, :company_number, :company_address ])
  end
end
