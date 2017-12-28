class Admin::CategoriesController < BaseController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @categories = @current_site.categories
  end

  def new
    @category = @current_site.categories.new
  end

  def edit
  end

  def create
    @category = @current_site.categories.new(category_params)
    @category.save
    redirect_to admin_categories_path(@site)
  end

  def update
    @category.update(category_params)
    redirect_to admin_categories_path(@site)
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path(@site)
  end

  private

  def set_category
    @category = @current_site.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:menu, :menu_url)
  end
end
