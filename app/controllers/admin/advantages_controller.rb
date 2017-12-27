class Admin::AdvantagesController < BaseController
  before_action :set_advantage, only: [:edit, :update, :show]

  def index
    @advantages = @current_site.advantages.all
  end

  def new
    @advantage = @current_site.advantages.new
  end

  def edit
  end

  def show
  end

  def create
    @advantage = @current_site.advantages.new(advantage_params)
    if @advantage.save
       redirect_to admin_advantages_path
    else
      render :new
    end
  end

  def update
    if @advantage.update(advantage_params)
       redirect_to admin_advantages_path
    else
      render :edit
    end
  end

  def destroy
    @advantage.destroy
    redirect_to admin_advantages_path
  end

  private

  def set_advantage
    @advantage = @current_site.advantages.find(params[:id])
  end

  def advantage_params
    params.require(:advantage).permit(:content, :avatar, :url)
  end
end
