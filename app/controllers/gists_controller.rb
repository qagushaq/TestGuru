class GistsController < ApplicationController

  before_action :set_test_passage

  def create
    gist = GistQuestionService.new(@test_passage.current_question)

    gist.call
    if gist.success?
      gist_url = gist.url_hash
      @gist = Gist.create(user_id: @test_passage.user_id, question_id: @test_passage.current_question.id, gist_url: gist_url)
      flash.now[:notice] = t('.success', gist: helpers.link_to_gist(@gist)).html_safe
    else
      flash.now[:notice] = t('.fail')
    end
     render '/test_passages/show'
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end
