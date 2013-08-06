Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  ENV["APP_APP_TWITTER_CONSUMER_KEY"],  ENV["APP_APP_TWITTER_CONSUMER_SECRET"]
end
