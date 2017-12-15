class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_category, only: [:edit, :update, :destroy]
  layout "admin"

  def index
    @site = current_user.site
    @categories = @site.categories
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @site = current_user.site
    @category = @site.categories.new(category_params)
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
    @site = current_user.site
    @category = @site.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:menu, :menu_url)
  end
end
