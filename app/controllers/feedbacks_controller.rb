class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      flash.notice = t('.success')
    else
      flash.alert = t('.failure')
    end
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
