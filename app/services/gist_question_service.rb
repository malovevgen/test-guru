class GistQuestionService

  def initialize(question)
    @question = question
    @test = @question.test
    @client = octokit
  end

  def call
    response = @client.create_gist(gist_params)

    GistResult.new(response)
  end

  def success?
    @client.last_response.data.html_url.present?
  end

  private

  def gist_params
    {
      description: I18n.t('gist.description', test: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << I18n.t('gist.answers')
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def octokit
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

end
