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

  def current_client
    remember_token = User.encrypt(cookies["sandbox_rb_token"])
    @current_client ||= User.find_by_remember_token(remember_token)
  end

  # Comprueba si el usuario es el mismo que el usuario que navega
  def its_me?(client)
    return (signed_in? and (current_client.id == client.id))
  end

end
