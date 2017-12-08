class Admin::FooterController < ApplicationController
  before_action :authenticate_user!
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
    params.require(:footer).permit(:footer_logo, :company_number, :company_address, :site_copyright)
  end

end
