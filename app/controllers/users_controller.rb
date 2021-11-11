class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def index
  end

  def new
  end

  def create
  end

  def show
    @user = current_user
    @events = @user.created_events.order('updated_at DESC')

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:first_name,:last_name,:description)
      if @user.update(user_params)
        redirect_to user_path(@user.id), success: "User modifié avec succès"
      else
        render 'edit'
      end

  end

  def destroy

  end
end
