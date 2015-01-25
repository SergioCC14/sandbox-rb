class Client < ActiveRecord::Base

  def self.api_find(id, current_token)  
    session = RedboothRuby::Session.new(token: current_token)
    client = RedboothRuby::Client.new(session)
    respuesta = client.me(:show)

    if !respuesta.blank?
      return respuesta
    else
      return nil
    end
  end

end