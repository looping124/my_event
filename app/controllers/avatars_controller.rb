class AvatarsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    @user.avatar.resize "100x100"
    # redirect_to(user_path(@user))
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @user = current_user
    # @avatar = ActiveStorage::Blob.find_signed(params[:id])
    @avatar = current_user.avatar
    @avatar.purge
    redirect_to user_path(@user.id)
  end
end
