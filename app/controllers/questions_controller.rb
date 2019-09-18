class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: 'List of test questions: <%= @test.questions.pluck(:body) %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new; end

  def destroy
    @question.destroy
  end

  def create
    question = @test.questions.create(question_params)
    redirect_to question
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

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end
end
