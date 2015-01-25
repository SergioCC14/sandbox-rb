class Project < ActiveRecord::Base

  attr_accessor :permalink, :organization_id, :description, :start_date, :end_date, :tracks_time, :public, :publish_pages, :settings, :deleted, :session, :archived, :type, :token

  has_many :task_lists

  def self.api_find(id, current_token)  
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)
    
    respuesta = client.project(:show, id: id)

    if !respuesta.blank?
      return self.cast_to_project(respuesta)
    else
      return nil
    end
  end

  def self.cast_to_project(response)
    response = response.as_json

    return Project.new(response)
  end

  # Devuelve todos los TaskList de un proyecto
  # Peticion a /task_lists/?project_id
  def task_lists(current_token)
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)

    client.task_list(:index, project_id: self.id).all
  end


end