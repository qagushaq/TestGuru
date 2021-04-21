class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.gists_with_question_url_email.order(created_at: :desc)
  end

end
