class Admin::FooterController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  layout 'admin'

  def new
    @site = Site.find(params[:site_id])
    @footer = @site.footer.new
  end


  private

  def navbar_set
    @site = Site.find(params[:site_id])
    @footer = @site.footer.find(params[:id])
  end

  def footer_params
    params.require(:footer).permit(:avatar, :company_number, :company_address, :site_copyright)
  end

end
