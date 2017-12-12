class Admin::FootersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
    @site = Site.find(params[:site_id])
    @footer = @site.footer
  end

  def create
    @footer = Footer.new(footer_params)
    @footer.save
    puts "=================="
  end

  private

  def footer_params
    params.require(:footer).permit(:avatar, :company_number, :company_address)
  end

end
