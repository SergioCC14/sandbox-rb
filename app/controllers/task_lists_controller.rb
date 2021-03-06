class TaskListsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_filter :connected?

  def show
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)

    if (@task_list = client.task_list(:show, id: params[:id]))

      # Tasks
      @tasks = client.task(:index, task_list_id: @task_list.id).all

      respond_to do |format|
        format.html { redirect_to project_path(:id => @task_list.project_id)}
        format.js { render }
      end
    else
      error404
    end
  end

  # POST
  def create
    if (!params[:id].blank? and !params[:name].blank?)
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      @task_list = client.task_list(:create, project_id: params[:id], name: params[:name], description: params[:description])

      redirect_to project_path(:id => @task_list.project_id)

    else
      error404
    end
  end

  # DELETE
  def destroy
    if (!params[:id].blank?) and (!params[:p_id].blank?)
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      @task_list = client.task_list(:delete, id: params[:id])

      redirect_to project_path(:id => params[:p_id])

    else
      error404
    end
  end

end