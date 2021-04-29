class FeedbacksMailer < ApplicationMailer

  def send_message(feedback)
    @email = feedback.email
    @message = feedback.message

    mail from: @email, subject: t('.subject')
  end

end
