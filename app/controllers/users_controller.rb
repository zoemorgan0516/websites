class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_user, only: [:edit, :update, :destroy, :show]
   layout 'admin'
   def index
      @users = User.all
      @users = @users.page params[:page]
   end

   def new
      @user = User.new
   end

   def create
     @user = User.new(user_params)
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

   private

   def set_user
     @user = User.find(params[:id])
   end

   def user_params
     params.require(:user).permit(:user_name, :site_url, :email, :password, :password_confirmation)
   end

   def set_title
    @title = "站点管理员信息"
   end
end
