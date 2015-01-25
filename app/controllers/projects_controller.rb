class ProjectsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_filter :connected?

  def show
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)

    if (@project = client.project(:show, id: params[:id]))
      
      # TasksLists
      @task_lists = client.task_list(:index, project_id: params[:id]).all

      render
    else
      error404
    end
  end
end