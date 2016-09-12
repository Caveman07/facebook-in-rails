module ApplicationHelper
  def current_user?(user)
    return true if current_user == user
  end
end
