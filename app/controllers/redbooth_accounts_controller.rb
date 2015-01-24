class RedboothAccountsController < ApplicationController

  include SessionsHelper

  def signup_redbooth
    if ((response = request.env['omniauth.auth']) and (params[:error].blank?))
      
      session = RedboothRuby::Session.new(token: response['credentials']['token'])
      client = RedboothRuby::Client.new(session)

      iniciar_sesion(client)

      redirect_to user_path(client(:show).id)

    
    else
      error404
    end
    
  end

end