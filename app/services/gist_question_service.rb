class GistQuestionService

  def initialize(question)
    @question = question
    @test = @question.test
    @client = octokit
  end

  def call
    @client.create_gist(gist_params)
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
    Octokit::Client.new(access_token: 'd7f4e760f2c54b3fcbdddb5995f11c5af2c1f2f5')
  end

end
