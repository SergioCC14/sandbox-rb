# https://github.com/teambox/omniauth-redbooth
# You can now access the URL: /auth/redbooth

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redbooth, ENV['RB_CLIENT_ID'], ENV['RB_CLIENT_SECRET']
end