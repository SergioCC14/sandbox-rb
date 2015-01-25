class ProjectsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  def show
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)

    if (@project = client.project(:show, id: params[:id]))
      
       raise current_token.inspect
       
      # TasksLists
      @tasks = client.task_list(:index, project_id: 1314968).all.as_json

      # Tasks
      @tasks = client.task(:index, project_id: 1314968).all.as_json

      render
    else
      error404
    end
  end
end