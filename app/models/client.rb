class User < ActiveRecord::Base

  def self.api_find(id, options={}, access_token=nil)
    respuesta = api_solicitud("user/#{id.to_i}", options, 'GET', {:access_token => access_token})

    if !respuesta.blank?
      return respuesta
    else
      return nil
    end
  end

end