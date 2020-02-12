class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.success! if @test_passage.success?
      current_user.badges.concat(BadgeService.new(@test_passage).select_badges) 
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

      if result.success?
                      Gist.create!(question: @test_passage.current_question, user: @test_passage.user, gist_url: result.html_url)
      flash[:notice] = "#{t('.success') } #{view_context.link_to(t('.view_gist'),
                                                                         result.html_url,
                                                                         target: "_blank")}"
      else
      flash[:alert] = t('.failure')
      end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
