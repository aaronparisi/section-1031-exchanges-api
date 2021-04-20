# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:8080',
      'http://localhost:5000',
      'http://localhost:8000',
      'https://1031-exchanges.aaronparisidev.com',
      'http://1031-exchanges.aaronparisidev.com',
      'https://www.1031-exchanges.aaronparisidev.com',
      'http://www.1031-exchanges.aaronparisidev.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      exposedHeaders: ["Set-Cookie"]
  end
end
