class HomeController < ApplicationController
  def index
    unless current_user.nil?
      redirect_to dashboard_path
    end
  end
end
