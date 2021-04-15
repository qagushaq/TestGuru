class Admin::QuestionsController < Admin::BaseController

  before_action :find_question, only: %i[show update edit destroy]
  before_action :find_test, only: %i[index new create]

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to action: :index
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
