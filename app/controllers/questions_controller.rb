class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    @test = @question.test
    render plain: "Test: #{@test.title}.\nQuestion: #{@question.body}"
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Not found"
  end

end
