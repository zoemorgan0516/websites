class Admin::CategoriesController < BaseController
  before_action :set_category, only: [:edit, :update, :destroy, :up, :down, :top, :bottom ]
  def index
    @categories = @current_site.categories.order(position: :asc)
  end

  def new
    @category = @current_site.categories.new
  end

  def edit
  end

  def create
    @category = @current_site.categories.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def update
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  def top
    @category.move_position_to_top
    @category.save
    redirect_to admin_categories_path
  end

  def up
    @category.move_position_higher!
    redirect_to admin_categories_path
  end

  def down
    @category.move_position_lower!
    redirect_to admin_categories_path
  end

  def bottom
    @category.move_position_to_bottom!
    redirect_to admin_categories_path
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = @current_site.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:menu, :menu_url)
  end
end
