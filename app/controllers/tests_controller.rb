class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = Test.find(params[:id]).questions
  end

  def new; end

  def destroy

  end

  def create
    test = @test.create(test_params)
    redirect_to test
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found.'
  end
end
