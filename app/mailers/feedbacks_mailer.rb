class FeedbacksMailer  <  ApplicationMailer

  default to: 'evgenymalov76@gmail.com'

  def send_feedback(feedback)
    @message = feedback.message
  end
end
