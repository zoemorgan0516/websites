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
    if @site.update(site_params)
       if not params[:photos].blank?
         params[:photos]['avatar'].each do |i|
           @photo = @site.photos.create!(:avatar => i)
         end
       end

       if not params[:advantage_pics].blank?
         params[:advantage_pics]['avatar'].each do |i|
           @photo = @site.advantage_pics.create!(:avatar => i)
         end
       end

       if not params[:cooperation_pics].blank?
         params[:cooperation_pics]['avatar'].each do |i|
           @photo = @site.cooperation_pics.create!(:avatar => i)
         end
       end
    end
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
    params.require(:site).permit(:advantage_string, :cooperation_url, :cooperation_string, :avatar, :name, :domain,
                                :slider_string1, :slider_string2, :slider_string3,
                                :advantage_string1,:advantage_string2,:advantage_string3,:advantage_string4,:advantage_string5,:advantage_string6,
                                :advantage_url1,:advantage_url2,:advantage_url3,:advantage_url4,:advantage_url5,:advantage_url6,
                                footer_attributes: [ :avatar, :company_number, :company_address ])

  end
end
