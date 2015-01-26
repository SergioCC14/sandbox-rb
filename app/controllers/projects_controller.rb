class ProjectsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_filter :connected?

  def show
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)

    if (@project = client.project(:show, id: params[:id]))
      
      # Client
      @client = client.me(:show)

      # TasksLists
      @task_lists = client.task_list(:index, project_id: params[:id]).all

      render
    else
      error404
    end
  end

  def create
    if (!params[:name].blank? and !params[:description].blank? and !params[:organization_id].blank?)
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      @project = client.project(:create, name: params[:name], description: params[:description], organization_id: params[:organization_id])

      redirect_to project_path(:id => @project.id)

    else
      error404
    end
  end

end