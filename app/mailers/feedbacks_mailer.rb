class FeedbacksMailer < ApplicationMailer
  default from: 'testappqagushaq@gmail.com'

  def send_message(feedback)
    @email = feedback.email
    @message = feedback.message

    mail from: @email, subject: t('.subject')
  end

end
