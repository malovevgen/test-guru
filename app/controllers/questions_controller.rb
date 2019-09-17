class QuestionsController < ApplicationController
  def index
    render inline: 'List of test questions: <%= Test.find(params[:test_id]).questions.pluck(:body) %>'
  end
end
