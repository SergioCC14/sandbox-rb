class RedboothAccount < ActiveRecord::Base

def signup_redbooth
  raise params.inspect
  # GET https://redbooth.com/oauth2/authorize?client_id=YOUR_CLIENT_ID&redirect_uri=http%3A%2F%2Fmysite.com%2Fauth&response_type=code
end

end