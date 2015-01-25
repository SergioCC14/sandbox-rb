class ClientsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  def show
    if (@client = Client.api_find(params[:id],current_token))
      
      # Proyectos
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)
      @projects = client.project(:index).all

      render
    else
      error404
    end
  end
end