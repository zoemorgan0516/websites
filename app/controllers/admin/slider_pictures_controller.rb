class Admin::SliderPicturesController < BaseController
  before_action :set_slider_picture, only: [:edit, :update, :show]

  def index
    @slider_pictures = @current_site.slider_pictures
  end

  def new
    @slider_picture = @current_site.slider_pictures.new
  end

  def edit
  end


  def create
    @slider_picture = @current_site.slider_pictures.new(slider_picture_params)
    if @slider_picture.save
       redirect_to admin_slider_pictures_path
    else
      render :new
    end
  end

  def update
    if @slider_picture.update(slider_picture_params)
       redirect_to admin_slider_pictures_path
    else
      render :edit
    end
  end

  def destroy
    @slider_picture.destroy
    redirect_to admin_slider_pictures_path
  end

  private

  def set_slider_picture
    @slider_picture = @current_site.slider_pictures.find(params[:id])
  end

  def slider_picture_params
    params.require(:slider_picture).permit(:content, :avatar, :url)
  end
end
