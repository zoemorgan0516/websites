class Admin::AdvantagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_advantage, only: [:edit, :update, :show]
  layout "admin"

  def index
    @site = current_user.site
    @advantages = @site.advantages.all
  end

  def new
    @site = current_user.site
    @advantage = @site.advantages.new
  end

  def edit
  end

  def show
  end

  def create
    @site = current_user.site
    @advantage = @site.advantages.new(advantage_params)
    if @advantage.save
       redirect_to admin_advantages_path(@site)
    else
      render :new
    end
  end

  def update
    if @advantage.update(advantage_params)
       redirect_to admin_advantages_path(@site)
    else
      render :edit
    end
  end

  def destroy
    @advantage.destroy
    redirect_to admin_advantages_path(@site)
  end

  private

  def set_advantage
    @site = current_user.site
    @advantage = @site.advantages.find(params[:id])
  end

  def advantage_params
    params.require(:advantage).permit(:content, :avatar)
  end
end
