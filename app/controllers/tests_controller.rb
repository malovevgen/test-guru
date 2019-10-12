
class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    current_user.tests << @test #takes only one argument and puts it at the end of the array
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found.'
  end
end
