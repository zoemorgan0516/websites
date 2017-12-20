class Admin::EmailsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_email, only: [:edit, :update, :show]
  layout "admin"

  def index
    @site = current_user.site
    @emails = @site.emails.all.page params[:page]
  end

  def new
    @email = Email.new
  end

  def edit
  end

  def show
  end

  def create
    @site = current_user.site
    @email = @site.emails.new(email_params)
    @email.save
    redirect_to admin_emails_path(@site)
  end

  def update
    if @email.update(email_params)
       redirect_to admin_emails_path(@site)
    else
       render :edit
    end
  end

  def destroy
    @email.destroy
    redirect_to admin_emails_path(@site)
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
