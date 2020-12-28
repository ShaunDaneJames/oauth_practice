class SessionsController < ApplicationController

  def create
    client_id = 'ce5b5c437014b8a5ce81'
    client_secret = 'b2ad08598edab97a72a05369fb655427d4ef8dc3'
    code = params[:code]

    conn = Faraday.new(
      url: 'https://github.com',
      headers: {
        'Accept': 'application/json'
      }
    )

    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{access_token}"
      }
    )
    response = conn.get('/user')
    data = JSON.parse(response.body, symbolize_names: true)

    require "pry"; binding.pry
  end
end
