class EmailsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_email, only: [:edit, :update, :show]
  def new
    @email = Email.new
  end

  def create
    @site = current_user.site
    @email = @site.emails.new(email_params)
    @email.save
    EmailMailer.notify_email_placed(@email).deliver!
    redirect_to site_path(@site)
  end

  private

  def set_email
    @site = current_user.site
    @email = @site.emails.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:name, :content, :email_address)
  end
end
