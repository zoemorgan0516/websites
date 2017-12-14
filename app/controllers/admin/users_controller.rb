class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: [:edit, :update, :destroy, :show, :favorite, :unfavorite]
  layout 'admin'
  def index
    if current_user.role == "super_admin"
      @users = User.all.page params[:page]
    else
      @current_site = current_user.site
      @users = User.where(site_id: @current_site.id).page params[:page]
    end
  end

  def new
    if current_user.role == "super_admin"
      @user = User.new
    else
     @user = @current_site.users.new
    end
  end

  def create
    if current_user.role == "super_admin"
      @user = User.new(user_params)
    else
      @user = @current_site.users.new(user_params)
    end
    if current_user.role != "super_admin" && @user.role == "super_admin"
       @user = @user.delete(:role)
       redirect_to users_path, notice: '用户没有权限'
       return
    end
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def favorite
      @user.favorite
      redirect_to users_path
  end

  def unfavorite
      @user.unfavorite
      redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :site_id, :role)
  end

  def set_title
    @title = "站点管理员信息"
  end
end
