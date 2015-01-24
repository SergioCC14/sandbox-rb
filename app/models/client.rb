class Client < ActiveRecord::Base


  def self.api_find(id, current_token)

    raise current_token.inspect

    session = RedboothRuby::Session.new(token: 1)
    respuesta = RedboothRuby::Client.new(session).me(:show)

    if !respuesta.blank?
      return respuesta
    else
      return nil
    end
  end

end