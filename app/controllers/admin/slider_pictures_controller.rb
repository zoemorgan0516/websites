class Admin::SliderPicturesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_slider_picture, only: [:edit, :update, :show]
  layout "admin"

  def index
    @site = current_user.site
    @slider_pictures = @site.slider_pictures.all
  end

  def new
    @site = current_user.site
    @slider_picture = SliderPicture.new
  end

  def edit
  end

  def show
  end

  def create
    @site = current_user.site
    @slider_picture = SliderPicture.new(slider_picture_params)
    @slider_picture.site = @site
    if @slider_picture.save
       redirect_to admin_slider_pictures_path(@site)
    else
      render :new
    end
  end

  def update
    if @slider_picture.update(slider_picture_params)
       redirect_to admin_slider_pictures_path(@site)
    else
      render :edit
    end
  end

  def destroy
    @slider_picture.destroy
    redirect_to admin_slider_pictures_path(@site)
  end

  private

  def set_slider_picture
    @site = current_user.site
    @slider_picture = SliderPicture.find(params[:id])
  end

  def slider_picture_params
    params.require(:slider_picture).permit(:content)
  end
end
