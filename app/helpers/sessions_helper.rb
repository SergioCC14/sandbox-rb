module SessionsHelper

  # Crea la cookie para mantener la sesión y un Token para localizarla y validarla
  def iniciar_sesion(client)
    cookies.permanent["sandbox_rb_token"] = client.session.token
    
    self.current_client = client
  end

  def sign_out
    self.current_client = nil
    cookies.delete("sandbox_rb_token")
  end

  def signed_in?
    !current_client.blank?
  end

  def current_client=(client)
    @current_user = client
  end

  def current_token
    return cookies["sandbox_rb_token"]
  end

  def current_client
    session = RedboothRuby::Session.new(token: cookies["sandbox_rb_token"])
    client = RedboothRuby::Client.new(session)
    @current_client ||= client.me(:show)
  end

  # Comprueba si el usuario es el mismo que el usuario que navega
  def its_me?(client)
    return (signed_in? and (current_client.id == client.id))
  end

end
