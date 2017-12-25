class Admin::ContentsClassesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_contents_class, only: [:edit, :update]
  layout "admin"

  def index
    @site = current_user.site
    @contents_class = @site.contents_classes
  end


  def edit
  end

  def create
    @site = current_user.site
    @contents_class = @site.contents_classes.new(contents_class_params)
    @contents_class.save
    redirect_to admin_contents_classes_path(@site)
  end

  def update
    @site = current_user.site
    @contents_class.update(contents_class_params)
    redirect_to admin_contents_classes_path(@site)
  end

  def destroy
    @contents_class.destroy
    redirect_to admin_contents_classes_path(@site)
  end

  private

  def set_contents_class
    @site = current_user.site
    @contents_class = @site.contents_classes.find(params[:id])
  end

  def contents_class_params
    params.require(:contents_class).permit(:name)
  end
end
