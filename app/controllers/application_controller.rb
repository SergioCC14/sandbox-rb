class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def error404
    respond_to do |format|
      format.js { render :nothing => true }
      format.html { render :template => "layouts/404", :layout => 'application', :status => 404 }
    end
  end
  
end
