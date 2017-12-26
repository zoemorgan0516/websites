class EmailsController < FrontBaseController

  def new
    @email = @current_site.emails.build
  end

  def create
    @email = @current_site.emails.create(email_params)
    EmailMailer.notify_email_placed(@email).deliver!
    EmailMailer.notify_email_placed_to_admin(@email).deliver!
    redirect_to root_path
  end

  private

  def email_params
    params.require(:email).permit(:name, :content, :email_address)
  end
end
