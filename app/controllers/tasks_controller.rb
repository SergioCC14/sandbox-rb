class TaskController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  def create
    if (!params[:id].blank? and !params[:name].blank?)
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      @tasklist = client.task_list(:create, project_id: params[:id], name: params[:name], description: params[:description])

      redirect_to project_path(:id => params[:id])

    else
      error404
    end
  end

end