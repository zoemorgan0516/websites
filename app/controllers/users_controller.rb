class UsersController < BaseController
   before_action :set_user, only: [:edit, :update, :destroy, :show, :favorite, :unfavorite]
   def index
      if current_user.role == "super"
        @users = User.all.page params[:page]
      else
        @users = User.where(site_id: @current_site.id).page params[:page]
      end
  end

  def new
    if current_user.role == "super"
      @user = User.new
    end
  end

   def create
     if current_user.role == "super"
      @user = User.new(user_params)
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
     params.require(:user).permit(:email, :password, :password_confirmation, :role, :site_id)
   end
end
