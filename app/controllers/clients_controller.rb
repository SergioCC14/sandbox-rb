class ClientsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  def show

    raise current_client.inspect
    @client = Client.api_find(params[:id])

  end
end