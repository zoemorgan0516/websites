class Admin::CooperationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_cooperation, only: [:edit, :update, :destroy]
  layout "admin"

  def index
    @site = current_user.site
    @cooperations = @site.cooperations
  end

  def new
    @cooperation = Cooperation.new
    @photo = @cooperation.photos.build
  end

  def edit
  end

  def create
    @site = current_user.site
    @cooperation = @site.cooperations.new(cooperation_params)
    @cooperation.save
    params[:photos]['avatar'].each do |i|
      @photo = @cooperation.photos.create!(:avatar => i)
    end
    redirect_to admin_cooperations_path(@site)
  end

  def update
    if @cooperation.update(params.require(:cooperation).permit!)
      if not params[:cooperation].blank?
        params[:photos]['avatar'].each do |i|
          @photo = @cooperation.photos.create!(:avatar => i)
        end
      end
    end
    redirect_to admin_cooperations_path(@site)
  end

  def destroy
    @cooperation.destroy
    redirect_to admin_cooperations_path(@site)    
  end


  private

  def set_cooperation
    @site = current_user.site
    @cooperation = @site.cooperations.find(params[:id])
  end

  def cooperation_params
    params.require(:cooperation).permit(:title, photos_attributes: [:id, :cooperation_id,:avatar])
  end
end
