class Admin::UsersController < ApplicationController
  before_action :is_admin?
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:first_name,:last_name,:description)
      if @user.update(user_params)
        redirect_to admin_users_path, success: "User modifié avec succès"
      else
        render 'edit'
      end
  end

end
