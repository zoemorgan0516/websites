class Admin::CooperationsController < BaseController
  before_action :set_cooperation, only: [:edit, :update, :destroy]
  layout "admin"

  def index
    @cooperations = @current_site.cooperations
  end

  def new
    @cooperation = @current_site.cooperations.new
  end

  def edit
  end

  def create
    @site = current_user.site
    @cooperation = @current_site.cooperations.new(cooperation_params)
    @cooperation.save
    redirect_to admin_cooperations_path(@site)
  end

  def update
    if @cooperation.update(params.require(:cooperation).permit!)
    end
    redirect_to admin_cooperations_path(@site)
  end

  def destroy
    @cooperation.destroy
    redirect_to admin_cooperations_path(@site)
  end

  private

  def set_cooperation
    @cooperation = @current_site.cooperations.find(params[:id])
  end

  def cooperation_params
    params.require(:cooperation).permit(:avatar, :cooperation_url, :cooperation_company)
  end
end
