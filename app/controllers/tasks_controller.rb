class TasksController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_filter :connected?

  def create

    if (!params[:task_list_id].blank? and !params[:name].blank? and !params[:description].blank?)
      session = RedboothRuby::Session.new(token: current_token)
      client = RedboothRuby::Client.new(session)

      @tasklist = client.task(:create, task_list_id: params[:task_list_id], name: params[:name], description: params[:description])

      redirect_to project_path(:id => params[:project_id])

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