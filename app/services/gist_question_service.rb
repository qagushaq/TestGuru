class GistQuestionService

  attr_reader :client, :test, :question, :response

  def initialize(question, client: nil)
    @client = client || GitHubClient.new
    @question = question
    @test = @question.test
  end

  def call
    @response = client.create_gist(gist_params)
  end

  def success?
    client.last_response_success?
  end

  def url_hash
    response[:id]
  end  

  private

  def gist_params
    { description: "#{I18n.t('.question_from')} #{test.title}",
      public: true,
      files: { 'test-guru-question.txt' => { content: gist_content } } }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
