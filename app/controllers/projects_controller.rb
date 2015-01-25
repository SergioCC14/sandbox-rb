class ProjectsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  def show
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)

    if (@project = client.project(:show, id: params[:id]))
      
      # TasksLists
      @task_lists = client.task_list(:index, project_id: params[:id]).all

      # Tasks
      # @tasks = {}
      # @task_lists.each do |tl|
      #   @tasks[tl.id] = client.task(:index, task_list_id: tl.id)

      # end

      render
    else
      error404
    end
  end
end