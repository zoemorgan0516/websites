class Admin::UrlAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_url_address, only: [:edit, :update, :destroy, :show, :favorite, :unfavorite]
  layout 'admin'
  def index
     @url_addresses = UrlAddress.all
     @url_addresses = @url_addresses.page params[:page]
  end

  def new
     @url_address = UrlAddress.new
  end

  def create
    @url_address = UrlAddress.new(url_address_params)
    if @url_address.save
      redirect_to admin_url_addresses_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @url_address.update(url_address_params)
      redirect_to admin_url_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @url_address.destroy
    redirect_to admin_url_addresses_path
  end

  private

  def set_url_address
    @url_address = UrlAddress.find(params[:id])
  end

  def url_address_params
    params.require(:url_address).permit(:site_url)
  end

end
