class GistQuestionService

  def initialize(question)
    @question = question
    @test = @question.test
    @client = octokit
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.data.html_url.present?
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def octokit
    Octokit::Client.new(access_token: '4ac8456c0f241ccb33213f05cf6e4c1cdcdc3170')
  end

end
