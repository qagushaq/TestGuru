class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      FeedbacksMailer.send_message(@feedback).deliver_now
      flash[:notice] = t('.success_feedback')
      redirect_to tests_url
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
