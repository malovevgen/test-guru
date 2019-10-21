class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = 'c369915693b065297f28fb9f6bc9d22d0d23c295'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    response = @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end

    JSON.parse(response.body)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
