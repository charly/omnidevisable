require Rails.root.join "lib/omniauth/strategies/devise"

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2
  provider :devise, fields: [:email] #, :model => MyCustomClass

end