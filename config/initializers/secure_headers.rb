SecureHeaders::Configuration.default do |config|
  config.cookies = {
    secure: true, # mark all cookies as secure
  }
end