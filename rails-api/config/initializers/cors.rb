Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'
    resource(
      '*',
      headers: ["Authorization"],
      expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
      methods: [:get, :patch, :put, :delete, :post],
    )
  end
end