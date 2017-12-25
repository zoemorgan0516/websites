class CategoriesController < BaseController
  def index
    @category = @current_site.categories
  end
end
