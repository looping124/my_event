module ApplicationHelper
  def is_admin?
    if current_user == nil || current_user.admin == false
      redirect_to root_path
    end
  end
end
