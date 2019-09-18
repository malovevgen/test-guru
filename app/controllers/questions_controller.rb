class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  def index
    render inline: 'List of test questions: <%= @test.questions.pluck(:body) %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new; end

  def create
    @question = Question.create(question_params)
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
