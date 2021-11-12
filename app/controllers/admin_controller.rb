class AdminController < ApplicationController
  
  def index
    is_admin?()
    @admin = current_user
    @events = Event.all.order('updated_at DESC')
    @users = User.all
  end

end
