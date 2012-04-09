class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 5
  end
  
end
