class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def signout
    sign_out
    redirect_to root_url
  end

  # Check if the user is connected
  def connected?
    if !signed_in?
      redirect_to root_path
    else
      root_path
    end
  end

  def index
    if !current_client.blank?
      redirect_to client_path(current_client.id)
    else
      render
    end

  end


  def error404
    respond_to do |format|
      format.js { render :nothing => true }
      format.html { render :template => "layouts/404", :layout => 'application', :status => 404 }
    end
  end
  
end
