class Admin::EmailsController < BaseController
  before_action :set_email, only: [:edit, :update, :show]

  def index
    @emails = @site.emails.all.page params[:page]
  end

  def destroy
    @email.destroy
    redirect_to admin_emails_path(@site)
  end

  private

  def set_email
    @email = @site.emails.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:name, :content, :email_address)
  end
end
