class GitHubClient
  
  def initialize
    @client=setup_github_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = "application/json"
      request.body = params.to_json
    end
  end

  private

  def setup_github_client
    Octokit::Client.new(access_token:ENV['PERSONAL_GITHUB_ACCESS_TOKEN'])
  end

end
