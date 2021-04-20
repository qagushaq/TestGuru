class GitHubClient

  attr_accessor :client

  def initialize
    @client = setup_github_client
  end

  def create_gist(params)
    client.create_gist(params)
  end

  def last_response_success?
    client.last_response.status == 201
  end

  private

  def setup_github_client
    Octokit::Client.new(access_token:ENV['PERSONAL_GITHUB_ACCESS_TOKEN'])
  end

end
