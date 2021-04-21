class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def create
    gist = GistQuestionService.new(@test_passage.current_question)
    gist.call
    if gist.success?
      gist_url = gist.url_hash
      @gist = Gist.create(user_id: @test_passage.user_id, question_id: @test_passage.current_question.id, gist_url: gist_url)
      flash.now[:notice] = t('.success', gist: helpers.link_to_gist(@gist)).html_safe
    else
      flash.now[:notice] = t('.failure')
    end
     redirect_to @test_passage
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      flash_options
      { notice: t.('.success') }
    else
      { alert: t.('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
