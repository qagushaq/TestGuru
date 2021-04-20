class GistsController<ApplicationControler

  before_action :set_test_passage

  def create
    GistQuestionService.new(@test_passage.current_question)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end
