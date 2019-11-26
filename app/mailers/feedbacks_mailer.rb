class FeedbacksMailer  <  ApplicationMailer

  def send_feedback(feedback)
    @message = feedback.message
    mail to: 'evgenymalov76@gmail.com'
  end
end
