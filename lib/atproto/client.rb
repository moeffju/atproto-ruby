require 'net/http'
require 'json'
require 'jwt'

module ATProto
  class Client
    attr_reader :access_token, :refresh_token

    def initialize(base_url)
      @base_url = base_url
    end

    def login(username, password)
      uri = URI("#{@base_url}/xrpc/com.atproto.server.createSession")
      request = Net::HTTP::Post.new(uri)
      request.content_type = 'application/json'
      request.body = JSON.generate({identifier: username, password: password})

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end

      if response.is_a?(Net::HTTPSuccess)
        body = JSON.parse(response.body)
        @access_token = body['accessJwt']
        @refresh_token = body['refreshJwt']
        true
      else
        false
      end
    end

    def refresh_session
      uri = URI("#{@base_url}/xrpc/com.atproto.server.refreshSession")
      request = Net::HTTP::Post.new(uri)
      request['Authorization'] = "Bearer #{@refresh_token}"

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end

      if response.is_a?(Net::HTTPSuccess)
        body = JSON.parse(response.body)
        @access_token = body['accessJwt']
        true
      else
        false
      end
    end
  end
end
