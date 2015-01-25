class TaskListsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

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
end