class ClientsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_filter :connected?
  
  def show
    if (@client = Client.api_find(params[:id],current_token))
      
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      # Projects
      @projects = client.project(:index).all

      # Organizations
      @organizations = client.organization(:index).all

      render
    else
      error404
    end
  end
end