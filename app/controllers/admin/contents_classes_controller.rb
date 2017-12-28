class Admin::ContentsClassesController < BaseController
  before_action :set_contents_class, only: [:edit, :update]

  def index
    @contents_classes = @current_site.contents_classes
  end

  def edit
  end

  def create
    @contents_class = @current_site.contents_classes.new(contents_class_params)
    @contents_class.save
    redirect_to admin_contents_classes_path
  end

  def update
    @contents_class.update(contents_class_params)
    redirect_to admin_contents_classes_path
  end

  def destroy
    @contents_class.destroy
    redirect_to admin_contents_classes_path
  end

  private

  def set_contents_class
    @contents_class = @current_site.contents_classes.find(params[:id])
  end

  def contents_class_params
    params.require(:contents_class).permit(:name)
  end
end
