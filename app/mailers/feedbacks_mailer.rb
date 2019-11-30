class FeedbacksMailer  <  ApplicationMailer

  def send_feedback(feedback)
    @message = feedback.message
    @email = feedback.email
    mail to: 'evgenymalov76@gmail.com'
  end
end
