module SessionsHelper
  include ApplicationHelper


  def authenticate
    permission_denied if current_user.nil?
  end
  
end
