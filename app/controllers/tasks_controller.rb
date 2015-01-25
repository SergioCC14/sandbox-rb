class TasksController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_filter :connected?

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

  # DELETE
  def destroy
    
    if (!params[:id].blank?) and (!params[:p_id].blank?)
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      @task = client.task(:delete, id: params[:id])

      redirect_to project_path(:id => params[:p_id])

    else
      error404
    end
  end

end