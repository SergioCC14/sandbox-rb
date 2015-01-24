RedboothRuby.config do |configuration|
  configuration[:consumer_key] = ENV['RB_CLIENT_ID']
  configuration[:consumer_secret] = ENV['RB_CLIENT_SECRET']
end