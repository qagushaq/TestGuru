class GistsController < ApplicationController

  def create

    @test_passage = TestPassage.find(params[:test_passage_id])
    gist = GistQuestionService.new(@test_passage.current_question)

    gist.call
    if gist.success?
      gist_url = gist.url_hash
      @gist = Gist.create(user_id: @test_passage.user_id, question_id: @test_passage.current_question.id, gist_url: gist_url)
      flash.now[:notice] = t('.success', gist: helpers.link_to_gist(@gist)).html_safe
    else
      flash.now[:notice] = t('.fail')
    end
     redirect_to @test_passage
  end

end
